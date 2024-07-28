//
//  LoginView.swift
//  MRDelta
//
//  Created by Zhifu Xie on 7/28/24.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var loginError = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn {
            HomePageView()
        } else {
            VStack {
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
                    .padding(.bottom, 20)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
                    .padding(.bottom, 20)
                
                if !loginError.isEmpty {
                    Text(loginError)
                        .foregroundColor(.red)
                        .padding(.bottom, 20)
                }
                
                Button(action: {
                    login()
                }) {
                    Text("Login")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("Login")
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                loginError = error.localizedDescription
                return
            }
            
            guard authResult?.user != nil else {
                loginError = "Failed to get user information."
                return
            }
            
            // Successfully logged in
            isLoggedIn = true
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

