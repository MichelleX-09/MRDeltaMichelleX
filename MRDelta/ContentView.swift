//
//  ContentView.swift
//  MRDelta
//
//  Created by Zhifu Xie on 7/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to MRDelta")
                    .font(.largeTitle)
                    .padding()
                        
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        }
                        .padding()
                        
                NavigationLink(destination: LoginView()) {
                    Text("Log In")
                        .font(.title)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        }
                        .padding()
                    }
                }
            }
        }

#Preview {
    ContentView()
}
