//
//  SignUpView.swift
//  MRDelta
//
//  Created by Zhifu Xie on 7/28/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isOrganization = false
    @State private var interestedInPlantingTrees = false
    @State private var interestedInOysterShellBagging = false
    @State private var phoneNumber = ""
    @State private var address = ""
    @State private var signUpError = ""
    @State private var isSignedUp = false
    
    var body: some View {
        if isSignedUp {
            HomePageView()
        } else {
            Form {
                Section(header: Text("Account Information")) {
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                    SecureField("Password", text: $password)
                }
                
                Section(header: Text("Profile Information")) {
                    Toggle("Are you an organization?", isOn: $isOrganization)
                    
                    Toggle("Interested in planting trees?", isOn: $interestedInPlantingTrees)
                    
                    Toggle("Interested in oyster shell bagging?", isOn: $interestedInOysterShellBagging)
                    
                    TextField("Phone Number", text: $phoneNumber)
                        .keyboardType(.phonePad)
                    
                    TextField("Address", text: $address)
                }
                
                if !signUpError.isEmpty {
                    Text(signUpError)
                        .foregroundColor(.red)
                        .padding()
                }
                
                Button(action: {
                    signUp()
                }) {
                    Text("Sign Up")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Sign Up")
        }
    }
    
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                signUpError = error.localizedDescription
                return
            }
            
            guard let user = authResult?.user else {
                signUpError = "Failed to get user information."
                return
            }
            
            // Construct profile with the provided information
            let profileData: [String: Any] = [
                "email": email,
                "isOrganization": isOrganization,
                "interestedInPlantingTrees": interestedInPlantingTrees,
                "interestedInOysterShellBagging": interestedInOysterShellBagging,
                "phoneNumber": phoneNumber,
                "address": address
            ]
            
            // Save profile data to Firestore (or any other database you choose)
            let db = Firestore.firestore()
            db.collection("users").document(user.uid).setData(profileData) { error in
                if let error = error {
                    signUpError = "Failed to save profile: \(error.localizedDescription)"
                } else {
                    // Successfully signed up and saved profile
                    isSignedUp = true
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}



