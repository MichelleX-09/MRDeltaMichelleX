//
//  WelcomeView.swift
//  MRDelta
//
//  Created by Zhifu Xie on 8/4/24.
//

import SwiftUI
import Firebase

struct WelcomeView: View {
    @Binding var isLoggedIn: Bool
    @Binding var isOrganizationUser: Bool

    @State private var alertMessage = ""
    @State private var showAlert = false

    var body: some View {
        ZStack {
            Color.palepink.ignoresSafeArea()
            VStack {
                Image("MRDeltaLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.top, 70)

                Text("Welcome to MRDelta!!")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()

                Spacer()
                HStack{
                    NavigationLink(destination: SignUpView(isLoggedIn: $isLoggedIn, isOrganizationUser: $isOrganizationUser)) {
                        Text("Sign Up")
                            .padding()
                            .background(Color.oliveGreen)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                    
                    NavigationLink(destination: LoginView(isLoggedIn: $isLoggedIn, isOrganizationUser: $isOrganizationUser)) {
                        Text("  Log In  ")
                            .padding()
                            .background(Color.oliveGreen)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }

                Button(action: logInVolunteer) {
                    Text("Guest View (Volunteer)")
                        .padding()
                        .background(Color.oliveGreen)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                Button(action: logInOrganization) {
                    Text("Guest View (Organization)")
                        .padding()
                        .background(Color.oliveGreen)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                Spacer()
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .navigationBarHidden(true)
    }

    func logInVolunteer() {
        let email = "vol@gmail.com"
        let password = "123456"

        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.alertMessage = error.localizedDescription
                self.showAlert = true
            } else if let user = result?.user {
                let db = Firestore.firestore()
                db.collection("users").document(user.uid).getDocument { document, error in
                    if let document = document, document.exists {
                        self.isOrganizationUser = document.get("isOrganization") as? Bool ?? false
                        self.isLoggedIn = true
                    } else {
                        self.alertMessage = "Document does not exist"
                        self.showAlert = true
                    }
                }
            }
        }
    }

    func logInOrganization() {
        let email = "org@gmail.com"
        let password = "123456"

        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.alertMessage = error.localizedDescription
                self.showAlert = true
            } else if let user = result?.user {
                let db = Firestore.firestore()
                db.collection("users").document(user.uid).getDocument { document, error in
                    if let document = document, document.exists {
                        self.isOrganizationUser = document.get("isOrganization") as? Bool ?? false
                        self.isLoggedIn = true
                    } else {
                        self.alertMessage = "Document does not exist"
                        self.showAlert = true
                    }
                }
            }
        }
    }
}

