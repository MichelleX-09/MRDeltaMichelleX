//
//  ProfileView.swift
//  MRDelta
//
//  Created by Zhifu Xie on 8/4/24.
//


import SwiftUI
import Firebase

struct ProfileView: View {
    @State private var user_name = ""
    @State private var isOrganization = false
    @State private var interestingOysterRestoration = false
    @State private var interestingTreePlant = false
    @State private var interestingBirdObservation = false
    @State private var canSwim = false
    @State private var canLift50pluslb = false
    @State private var phoneNumber = ""
    @State private var address = ""
    @State private var earnedPoints = 0
    @State private var showGameLevels = false

    var body: some View {
        ZStack {
            Color.palepink.ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Text("Profile")
                        .font(.largeTitle)
                        .padding(.top, 20) // Adjust top padding as needed

                    VStack(alignment: .leading, spacing: 5) {
                        Text("Full Name: \(user_name)")
                        Text("Is Organization: \(isOrganization ? "Yes" : "No")")
                        Text("Like Oyster Restoration: \(interestingOysterRestoration ? "Yes" : "No")")
                        Text("Interested in Tree Plant: \(interestingTreePlant ? "Yes" : "No")")
                        Text("Interested in Bird Observation: \(interestingBirdObservation ? "Yes" : "No")")
                        Text("Can Lift 50+ lb: \(canLift50pluslb ? "Yes" : "No")")
                        Text("Can Swim: \(canSwim ? "Yes" : "No")")
                        Text("Phone Number: \(phoneNumber)")
                        Text("Address: \(address)")
                        Text("Earned Points: \(earnedPoints)")
                        Text("Badge Status: \(badgeStatus(for: earnedPoints))")
                            .bold()
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding()

                    Text("Badge Status is assigned based on your Earned Points.  Bronze: 10+; Palladium: 1000+; Platinum: 2500+; Silver:5000+, and Gold: 10000+")
                        .padding()
                        .multilineTextAlignment(.center)

                    Button(action: {
                        showGameLevels = true
                    }) {
                        Text("Award: Game Time")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            .onAppear(perform: loadProfile)
            .sheet(isPresented: $showGameLevels) {
                GameLevelsView(earnedPoints: earnedPoints)
            }
        }
    }

    func loadProfile() {
        if let user = Auth.auth().currentUser {
            let db = Firestore.firestore()
            db.collection("users").document(user.uid).getDocument { document, error in
                if let document = document, document.exists {
                    let data = document.data()
                    self.user_name = data?["user_name"] as? String ?? ""
                    self.isOrganization = data?["isOrganization"] as? Bool ?? false
                    self.interestingOysterRestoration = data?["interestingOysterRestoration"] as? Bool ?? false
                    self.interestingTreePlant = data?["interestingTreePlant"] as? Bool ?? false
                    self.interestingBirdObservation = data?["interestingBirdObservation"] as? Bool ?? false
                    self.canSwim = data?["canSwim"] as? Bool ?? false
                    self.canLift50pluslb = data?["canLift50pluslb"] as? Bool ?? false
                    self.phoneNumber = data?["phone_number"] as? String ?? ""
                    self.address = data?["address"] as? String ?? ""
                    self.earnedPoints = data?["earned_points"] as? Int ?? 0
                } else {
                    print("Document does not exist")
                }
            }
        }
    }

    func badgeStatus(for points: Int) -> String {
        switch points {
        case 0..<1000:
            return "Bronze"
        case 1000..<2500:
            return "Palladium"
        case 2500..<5000:
            return "Platinum"
        case 5000..<10000:
            return "Silver"
        default:
            return "Gold"
        }
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
