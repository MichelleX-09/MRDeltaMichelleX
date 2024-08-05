//
//  DeltaRivalCampaignView.swift
//  MRDelta
//
//  Created by Zhifu Xie on 8/4/24.
//

import SwiftUI
import Firebase
import FirebaseStorage
import PhotosUI

struct DeltaRivalCampaignView: View {
    @State private var selectedImage: UIImage?
    @State private var showingShareSheet = false
    @State private var showingDeleteAlert = false
    @State private var userPoints = 0
    @State private var adImages: [String] = [] // Use URLs from Firestore
    @State private var adImageURLs: [String] = []
    @State private var isOrganizationUser = false
    @State private var imageToDelete: String?
    @State private var imageToShare: UIImage?
    @State private var imageToShareURL: URL?

    var body: some View {
        NavigationView {
            VStack {
                if  !isOrganizationUser{
                    Text("Double click a Campaign Picture to Share to Earn Points")
                        .font(.headline)
                        .padding()
                }

                if  isOrganizationUser{
                    Text("Double click a Campaign Picture to Share")
                        .font(.headline)
                        .padding()
                }
                
                ScrollView(.vertical) {
                    VStack(spacing: 10) {
                        ForEach(adImageURLs, id: \.self) { url in
                            AsyncImage(url: URL(string: url)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 400, height: 400)
                                    .onTapGesture {
                                        self.imageToShareURL = URL(string: url)
                                        loadImage(from: self.imageToShareURL!) { uiImage in
                                            self.imageToShare = uiImage
                                            self.showingShareSheet = true
                                        }
                                    }
                            } placeholder: {
                                ProgressView()
                            }
                            .contextMenu {
                                if isOrganizationUser {
                                    Button(action: {
                                        // Mark the image for deletion
                                        imageToDelete = url
                                        showingDeleteAlert = true
                                    }) {
                                        Text("Delete")
                                        Image(systemName: "trash")
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }

                if let selectedImage = selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                }

                Text("Your Earned Points: \(userPoints)")
                    .padding()
                if isOrganizationUser {
                    Text("Select a campain to delete by long press")
                        .padding()
                }
/*                if isOrganizationUser {
                    NavigationLink(destination: AdvertisementUploadView()) {
                        Text("Manage Advertisements")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }
*/
                Spacer()
            }
            .sheet(isPresented: $showingShareSheet, onDismiss: updatePoints) {
                if let imageToShare = imageToShare {
                    ShareSheet(activityItems: [imageToShare])
                }
            }
            .onAppear {
                fetchUserPoints()
                checkIfOrganizationUser()
                fetchAdImages()
            }
            .alert(isPresented: $showingDeleteAlert) {
                Alert(title: Text("Delete Image"), message: Text("Are you sure you want to delete this image?"), primaryButton: .destructive(Text("Delete")) {
                    if let imageURL = imageToDelete {
                        deleteImageFromFirestore(imageURL)
                    }
                }, secondaryButton: .cancel())
            }
        }
    }

    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }

    func uploadImage(url: URL) {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        let storageRef = Storage.storage().reference().child("adImages/\(UUID().uuidString).jpg")

        storageRef.putFile(from: url, metadata: nil) { metadata, error in
            if let error = error {
                print("Error uploading image: \(error.localizedDescription)")
                return
            }
            storageRef.downloadURL { url, error in
                if let error = error {
                    print("Error getting download URL: \(error.localizedDescription)")
                    return
                }
                if let downloadURL = url?.absoluteString {
                    saveImageURLToFirestore(downloadURL)
                }
            }
        }
    }

    func saveImageURLToFirestore(_ url: String) {
        let db = Firestore.firestore()
        db.collection("adImages").addDocument(data: ["url": url]) { error in
            if let error = error {
                print("Error saving image URL to Firestore: \(error.localizedDescription)")
            } else {
                print("Image URL saved successfully!")
                fetchAdImages()  // Fetch images to update the view
            }
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
                        fetchAdImages() // Update the view
                    }
                }
            }
        }
    }

    func fetchAdImages() {
        let db = Firestore.firestore()
        db.collection("adImages").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching ad images: \(error.localizedDescription)")
                return
            }
            guard let documents = snapshot?.documents else { return }
            self.adImageURLs = documents.compactMap { $0.get("url") as? String }
        }
    }

    func fetchUserPoints() {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()
        let userRef = db.collection("users").document(userID)
        userRef.getDocument { document, error in
            if let document = document, document.exists {
                if let points = document.get("earned_points") as? Int {
                    self.userPoints = points
                }
            } else {
                print("Document does not exist")
            }
        }
    }

    func checkIfOrganizationUser() {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()
        let userRef = db.collection("users").document(userID)
        userRef.getDocument { document, error in
            if let document = document, document.exists {
                self.isOrganizationUser = document.get("isOrganization") as? Bool ?? false
            }
        }
    }

    func updatePoints() {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()
        let userRef = db.collection("users").document(userID)
        userRef.updateData([
            "earned_points": FieldValue.increment(Int64(10))
        ]) { error in
            if let error = error {
                print("Error updating points: \(error)")
            } else {
                fetchUserPoints()
            }
        }
    }

    func convertAsyncImageToUIImage(_ image: Image) -> UIImage? {
        // Convert SwiftUI Image to UIImage
        let controller = UIHostingController(rootView: image)
        let view = controller.view
        let renderer = UIGraphicsImageRenderer(size: view?.bounds.size ?? .zero)
        return renderer.image { ctx in
            view?.drawHierarchy(in: view?.bounds ?? .zero, afterScreenUpdates: true)
        }
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    var activityItems: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
