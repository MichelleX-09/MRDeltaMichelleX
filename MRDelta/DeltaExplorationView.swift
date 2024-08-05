//
//  DeltaExplorationView.swift
//  MRDelta
//
//  Created by Zhifu Xie on 8/4/24.
//

import SwiftUI
import PDFKit

struct DeltaExplorationView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    OverviewSection()
                    CrisisSection()
                    RestorationSection()
                    BusinessSection()
                }
                .padding()
            }
            .background(Color.palepink.ignoresSafeArea())
            .navigationTitle("Delta Explorer")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct OverviewSection: View {
    @State private var showOverviewDetails = false

    var body: some View {
        VStack {
            Image("OverviewM")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding()

            Button(action: {
                showOverviewDetails = true
            }) {
                Text("Delta Overview")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
        .fullScreenCover(isPresented: $showOverviewDetails) {
            OverviewDetailsView()
        }
    }
}

struct CrisisSection: View {
    @State private var showCrisisDetails = false

    var body: some View {
        VStack {
            Image("DeCrisisM")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding()

            Button(action: {
                showCrisisDetails = true
            }) {
                Text("Delta Crisis")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
        .fullScreenCover(isPresented: $showCrisisDetails) {
            CrisisDetailsView()
        }
    }
}

struct RestorationSection: View {
    @State private var showRestorationDetails = false

    var body: some View {
        VStack {
            Image("RestoreM")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding()

            Button(action: {
                showRestorationDetails = true

            }) {
                Text("Delta Restoration")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
        .fullScreenCover(isPresented: $showRestorationDetails) {
            RestorationDetailsView()
        }
    }
}


struct BusinessSection: View {
@State private var showBusinessDetails = false

var body: some View {
    VStack {
        Image("CommunityGuide") //("MRDeltaLogo")
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 200)
            .padding()

        Button(action: {
            showBusinessDetails = true
        }) {
            Text("Delta Community Guide")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .padding()
    }
    .background(Color.white)
    .cornerRadius(10)
    .shadow(radius: 5)
    .padding(.horizontal)
    .fullScreenCover(isPresented: $showBusinessDetails) {
        BusinessDetailsView()
    }
}
}

struct OverviewDetailsView: View {
@Environment(\.presentationMode) var presentationMode
@State private var currentScale: CGFloat = 1.0

var body: some View {
    NavigationView {
        ScrollView {
            VStack {
                ForEach(["Overview1", "Overview2", "Overview3"], id: \.self) { imageName in
                    ZoomableImage(imageName: imageName, currentScale: $currentScale)
                        .frame(maxWidth: .infinity)
                        .aspectRatio(contentMode: .fit)
                }

                Link("Find More Information...", destination: URL(string: "https://mississippiriverdelta.org/")!)
                    .padding()
                    .foregroundColor(.blue)
            }
            .padding()
        }
        .navigationTitle("Overview")
        .navigationBarItems(leading: Button("Back") {
            presentationMode.wrappedValue.dismiss()
        })
    }
}
}

struct CrisisDetailsView: View {
@Environment(\.presentationMode) var presentationMode
@State private var currentScale: CGFloat = 1.0

var body: some View {
    NavigationView {
        ScrollView {
            VStack {
                ForEach(["DeCrisis1", "DeCrisis2"], id: \.self) { imageName in
                    ZoomableImage(imageName: imageName, currentScale: $currentScale)
                        .frame(maxWidth: .infinity)
                        .aspectRatio(contentMode: .fit)
                }

                Link("Find More Information...", destination: URL(string: "https://mississippiriverdelta.org/our-coastal-crisis/")!)
                    .padding()
                    .foregroundColor(.blue)
            }
            .padding()
        }
        .navigationTitle("Crisis")
        .navigationBarItems(leading: Button("Back") {
            presentationMode.wrappedValue.dismiss()
        })
    }
}
}

struct RestorationDetailsView: View {
@Environment(\.presentationMode) var presentationMode
@State private var currentScale: CGFloat = 1.0

var body: some View {
    NavigationView {
        ScrollView {
            VStack {
                ForEach(["Restore1", "Restore2", "Restore3", "Restore4"], id: \.self) { imageName in
                    ZoomableImage(imageName: imageName, currentScale: $currentScale)
                        .frame(maxWidth: .infinity)
                        .aspectRatio(contentMode: .fit)
                }

                Link("Find More Information...", destination: URL(string: "https://mississippiriverdelta.org/restoration-solutions/")!)
                    .padding()
                    .foregroundColor(.blue)
            }
            .padding()
        }
        .navigationTitle("Restoration")
        .navigationBarItems(leading: Button("Back") {
            presentationMode.wrappedValue.dismiss()
        })
    }
}
}

struct BusinessDetailsView: View {
@Environment(\.presentationMode) var presentationMode

var body: some View {
    NavigationView {
        VStack {
            if let pdfURL = Bundle.main.url(forResource: "MRDeltaBP2", withExtension: "pdf") {
                PDFKitView(url: pdfURL)
                    .scaledToFit()
                    .frame(maxHeight: .infinity)
                    .padding()
            } else {
                Text("PDF not found")
                    .foregroundColor(.red)
            }

            Link("Find More Information...", destination: URL(string: "https://mississippiriverdelta.org/handbook/coastal-protection-and-restoration-authority/")!)
                .padding()
                .foregroundColor(.blue)
        }
        .padding()
        .navigationTitle("Delta Community Guide")
        .navigationBarItems(leading: Button("Back") {
            presentationMode.wrappedValue.dismiss()
        })
    }
}
}

struct ZoomableImage: View {
let imageName: String
@Binding var currentScale: CGFloat

var body: some View {
    Image(imageName)
        .resizable()
        .scaledToFit()
        .scaleEffect(currentScale)
        .gesture(MagnificationGesture()
                    .onChanged { value in
                        currentScale = value.magnitude
                    }
                    .onEnded { _ in
                        currentScale = 1.0
                    })
        .padding()
}
}

struct PDFKitView: UIViewRepresentable {
let url: URL

func makeUIView(context: Context) -> UIView {
    let view = UIView()
    let pdfView = PDFView()

    pdfView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(pdfView)
    NSLayoutConstraint.activate([
        pdfView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        pdfView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        pdfView.topAnchor.constraint(equalTo: view.topAnchor),
        pdfView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])

    pdfView.document = PDFDocument(url: url)
    pdfView.autoScales = true

    return view
}

func updateUIView(_ uiView: UIView, context: Context) {}
}

struct DeltaExplorationView_Previews: PreviewProvider {
static var previews: some View {
    DeltaExplorationView()
}
}
