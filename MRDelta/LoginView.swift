//
//  LoginView.swift
//  MRDelta
//
//  Created by Zhifu Xie on 8/4/24.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @Binding var isLoggedIn: Bool
    @Binding var isOrganizationUser: Bool

    var body: some View {
        ZStack {
            Color.palepink.ignoresSafeArea()
            VStack {
                Image("MRDeltaLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.top, 50)

                Text("Together, we can make a difference!")
                    .font(.headline)
                    .padding()

                Spacer()

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: logIn) {
                    Text("Log In")
                        .padding()
                        .background(Color.blue)
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
    }

    func logIn() {
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

