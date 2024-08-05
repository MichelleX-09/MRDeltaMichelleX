//
//  SignUpView.swift
//  MRDelta
//
//  Created by Zhifu Xie on 7/28/24.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var isOrganization = false
    @State private var interestingOysterRestoration = false
    @State private var interestingTreePlant = false
    @State private var interestingBirdObservation =  false
    @State private var canSwim = false
    @State private var canLift50pluslb = false
    @State private var phoneNumber = ""
    @State private var address = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @Binding var isLoggedIn: Bool
    @Binding var isOrganizationUser: Bool

    var body: some View {
        ZStack {
            Color.palepink.ignoresSafeArea()
            VStack {
                Form {
                    Section(header: Text("Account Information")) {
                        TextField("Email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                    Section(header: Text("Profile Information")) {
                        TextField("Full Name", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        TextField("Phone Number", text: $phoneNumber)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        TextField("Address", text: $address)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        Toggle(isOn: $isOrganization) {
                            Text("Is Organization")
                        }

                        Toggle(isOn: $interestingOysterRestoration) {
                            Text("Interested in Oyster Restoration")
                        }

                        Toggle(isOn: $interestingTreePlant) {
                            Text("Interested in Tree Planting")
                        }
                        Toggle(isOn: $interestingBirdObservation) {
                            Text("Interested in Bird Observation")
                        }
                        Toggle(isOn: $canLift50pluslb) {
                            Text("Can lift 50+ lb")
                        }
                        Toggle(isOn: $canSwim) {
                            Text("Can Swim")
                        }

                    }
                }

                Button(action: signUp) {
                    Text("Sign Up")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }
        }
    }

    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.alertMessage = error.localizedDescription
                self.showAlert = true
            } else if let user = result?.user {
                let db = Firestore.firestore()
                db.collection("users").document(user.uid).setData([
                    "user_name": self.username,
                    "isOrganization": self.isOrganization,
                    "interestingOysterRestoration": self.interestingOysterRestoration,
                    "interestingTreePlant": self.interestingTreePlant,
                    "interestingBirdObservation": self.interestingBirdObservation,
                    "canLift50pluslb": self.canLift50pluslb,
                    "canSwim": self.canSwim,
                    "phone_number": self.phoneNumber,
                    "address": self.address,
                    "earned_points": 10
                ]) { error in
                    if let error = error {
                        self.alertMessage = error.localizedDescription
                        self.showAlert = true
                    } else {
                        self.isOrganizationUser = self.isOrganization
                        self.isLoggedIn = true
                    }
                }
            }
        }
    }
}

extension Color {
    static let palepink = Color(red: 1.0, green: 0.94, blue: 0.96)
}



