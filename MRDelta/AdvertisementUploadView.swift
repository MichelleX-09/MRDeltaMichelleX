//
//  AdvertisementUploadView.swift
//  MRDelta
//
//  Created by Zhifu Xie on 8/4/24.
//

import SwiftUI
import Firebase
import FirebaseStorage
import PhotosUI

struct AdvertisementUploadView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State private var showingImagePicker = false
    @State private var adImageURLs: [String] = []
    @State private var isLoading = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var showingDeleteAlert = false
    @State private var imageToDelete: String?

    var body: some View {
        ZStack {
            Color.palepink.ignoresSafeArea()
            ScrollView{
                VStack {
                    VStack {
                        NavigationLink(destination: MainPageView()) {
                            Text("Go to Home Page")
                                .font(.body)
                                .padding()
                                .background(Color.oliveGreen)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                    
                    VStack {
/*                        Image("launchcampaign2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 120)
  */
                        Button(action: {
                            showingImagePicker = true
                        }) {
                            Text("Click here to launch a campaign")
                                .font(.largeTitle)
                                .padding()
                                .background(Color.yellow)
                                .foregroundColor(.black)
                                .cornerRadius(8)
                        }
                        .padding()
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .photosPicker(isPresented: $showingImagePicker, selection: $selectedItem, matching: .images)
                    .padding(.horizontal)
                    .padding()
                    
                    if let selectedImageData = selectedImageData {
                        Image(uiImage: UIImage(data: selectedImageData)!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300)
                            .padding()
                        
                        if isLoading {
                            ProgressView("Uploading...")
                                .padding()
                        } else {
                            Button("Upload Campaign") {
                                uploadImage()
                            }
                            .padding()
                        }
                    }

                    Text("Delete a campaign below by long press.")
                        .font(.headline)
                        .padding()
                    
                    ScrollView {
                        VStack {
                            ForEach(adImageURLs, id: \.self) { url in
                                AsyncImage(url: URL(string: url)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 300, height: 300)
                                        .contextMenu {
                                            Button(action: {
                                                imageToDelete = url
                                                showingDeleteAlert = true
                                            }) {
                                                Text("Delete")
                                                Image(systemName: "trash")
                                            }
                                        }
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                    }
                    .padding()
                    .onAppear(perform: fetchAdImageURLs)
                    .onChange(of: selectedItem) { newItem in
                        Task {
                            // Retrieve selected asset in the form of Data
                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                selectedImageData = data
                            }
                        }
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                    }
                    .alert(isPresented: $showingDeleteAlert) {
                        Alert(title: Text("Delete Image"), message: Text("Are you sure you want to delete this image?"), primaryButton: .destructive(Text("Delete")) {
                            if let imageURL = imageToDelete {
                                deleteImageFromFirestore(imageURL)
                            }
                        }, secondaryButton: .cancel())
                    }
                }}
        }
    }

    func uploadImage() {
        guard let data = selectedImageData else { return }
        isLoading = true
        
        let storageRef = Storage.storage().reference().child("adImages/\(UUID().uuidString).jpg")
        let uploadTask = storageRef.putData(data, metadata: nil) { metadata, error in
            isLoading = false
            
            if let error = error {
                alertMessage = "Error uploading image: \(error.localizedDescription)"
                showAlert = true
                return
            }
            
            storageRef.downloadURL { url, error in
                if let error = error {
                    alertMessage = "Error getting download URL: \(error.localizedDescription)"
                    showAlert = true
                    return
                }
                
                if let downloadURL = url?.absoluteString {
                    saveImageURLToFirestore(downloadURL)
                }
            }
        }
        
        uploadTask.observe(.progress) { snapshot in
            // Optional: Track upload progress here
            let percentComplete = 100.0 * Double(snapshot.progress?.fractionCompleted ?? 0)
            print("Upload is \(percentComplete)% complete")
        }
    }
    
    func saveImageURLToFirestore(_ url: String) {
        let db = Firestore.firestore()
        db.collection("adImages").addDocument(data: ["url": url]) { error in
            if let error = error {
                alertMessage = "Error saving image URL to Firestore: \(error.localizedDescription)"
                showAlert = true
            } else {
                print("Image URL saved successfully!")
                fetchAdImageURLs()  // Fetch images to update the view
            }
        }
    }
    
    func fetchAdImageURLs() {
        let db = Firestore.firestore()
        db.collection("adImages").getDocuments { snapshot, error in
            if let error = error {
                alertMessage = "Error fetching ad images: \(error.localizedDescription)"
                showAlert = true
                return
            }
            guard let documents = snapshot?.documents else { return }
            self.adImageURLs = documents.compactMap { $0.get("url") as? String }
        }
    }

    func deleteImageFromFirestore(_ url: String) {
        let db = Firestore.firestore()
        let query = db.collection("adImages").whereField("url", isEqualTo: url)

        query.getDocuments { snapshot, error in
            if let error = error {
                print("Error finding document: \(error.localizedDescription)")
                return
            }
            guard let documents = snapshot?.documents, !documents.isEmpty else {
                print("No matching documents found")
                return
            }
            for document in documents {
                document.reference.delete() { error in
                    if let error = error {
                        print("Error deleting document: \(error.localizedDescription)")
                    } else {
                        print("Document successfully deleted!")
                        fetchAdImageURLs() // Update the view
                    }
                }
            }
        }
    }
}
