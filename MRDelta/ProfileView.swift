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
                        .fontWeight(.semibold)
                        .padding(.top, 20) // Adjust top padding as needed
                    Image("profiledone")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)

                    VStack(alignment: .leading, spacing: 5) {
                        Text("Full Name: ")
                            .foregroundColor(.purple)
                            .fontWeight(.semibold) +
                        Text("\(user_name)")

                        Text("Is Organization: ")
                            .foregroundColor(.purple)
                            .fontWeight(.semibold) +
                        Text("\(isOrganization ? "Yes" : "No")")

                        Text("Like Oyster Restoration: ")
                            .foregroundColor(.purple)
                            .fontWeight(.semibold) +
                        Text("\(interestingOysterRestoration ? "Yes" : "No")")

                        Text("Interested in Tree Plant: ")
                            .foregroundColor(.purple)
                            .fontWeight(.semibold) +
                        Text("\(interestingTreePlant ? "Yes" : "No")")

                        Text("Interested in Bird Observation: ")
                            .foregroundColor(.purple)
                            .fontWeight(.semibold) +
                        Text("\(interestingBirdObservation ? "Yes" : "No")")

                        Text("Can Lift 50+ lb: ")
                            .foregroundColor(.purple)
                            .fontWeight(.semibold) +
                        Text("\(canLift50pluslb ? "Yes" : "No")")

                        Text("Can Swim: ")
                            .foregroundColor(.purple)
                            .fontWeight(.semibold) +
                        Text("\(canSwim ? "Yes" : "No")")

                        Text("Phone Number: ")
                            .foregroundColor(.purple)
                            .fontWeight(.semibold) +
                        Text("\(phoneNumber)")

                        Text("Address: ")
                            .foregroundColor(.purple)
                            .fontWeight(.semibold) +
                        Text("\(address)")

                        Text("Earned Points: ")
                            .foregroundColor(.purple)
                            .fontWeight(.semibold) +
                        Text("\(earnedPoints)")

                        Text("Badge Level: ")
                            .foregroundColor(.purple)
                            .fontWeight(.bold) +
                        Text("\(badgeStatus(for: earnedPoints))")
                            .bold()

                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding()
                    VStack{
                        Text("Badge level is based on your Earned Points.")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding()
                            .multilineTextAlignment(.center)
                        HStack{
                            ZStack{
                                Circle()
                                    .fill(Color.bronze)
                                    .frame(width: 70, height: 70)
                                    .shadow(color: .gray, radius: 10, x: 5, y: 5)
                                VStack{
                                    Text("Bronze: ")
                                        .font(.system(size: 15))
                                        .foregroundColor(.black)
                                        .shadow(color: .white, radius: 2, x: 1, y: 1)
                                    Text("10+")
                                        .font(.system(size: 14))
                                        .foregroundColor(.black)
                                        .shadow(color: .white, radius: 2, x: 1, y: 1)
                                }
                            }
                            .frame(maxWidth: 100)
                            
                            ZStack{
                                Circle()
                                    .fill(Color.palladium)
                                    .frame(width: 70, height: 70)
                                    .shadow(color: .gray, radius: 10, x: 5, y: 5)
                                VStack{
                                    Text("Palladium:")
                                        .font(.system(size: 14))
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 2, x: 1, y: 1)
                                    Text("1000+")
                                        .font(.system(size: 14))
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 2, x: 1, y: 1)
                                }
                            }
                            .frame(maxWidth: 100)
                            
                            ZStack{
                                Circle()
                                    .fill(Color.platinum)
                                    .frame(width: 70, height: 70)
                                    .shadow(color: .gray, radius: 10, x: 5, y: 5)
                                VStack{
                                    Text("Platinum: ")
                                        .font(.system(size: 14))
                                        .foregroundColor(.black)
                                        .shadow(color: .white, radius: 2, x: 1, y: 1)
                                    Text("2500+")
                                        .font(.system(size: 14))
                                        .foregroundColor(.black)
                                        .shadow(color: .white, radius: 2, x: 1, y: 1)
                                }
                            }
                            .frame(maxWidth: 100)
                            
                            ZStack{
                                Circle()
                                    .fill(Color.silver)
                                    .frame(width: 70, height: 70)
                                    .shadow(color: .gray, radius: 10, x: 5, y: 5)
                                VStack{
                                    Text("Silver: ")
                                        .font(.system(size: 15))
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 2, x: 1, y: 1)
                                    Text("5000+")
                                        .font(.system(size: 14))
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 2, x: 1, y: 1)
                                }
                            }
                            .frame(maxWidth: 100)
                            
                            ZStack{
                                Circle()
                                    .fill(Color.gold)
                                    .frame(width: 70, height: 70)
                                    .shadow(color: .gray, radius: 10, x: 5, y: 5)
                                VStack{
                                    Text("Gold: ")
                                        .font(.system(size: 15))
                                        .foregroundColor(.black)
                                        .shadow(color: .white, radius: 2, x: 1, y: 1)
                                    Text("10000+")
                                        .font(.system(size: 14))
                                        .foregroundColor(.black)
                                        .shadow(color: .white, radius: 2, x: 1, y: 1)
                                }
                            }
                            .frame(maxWidth: 100)
                            
                        }
                    }
                    Button(action: {
                        showGameLevels = true
                    }) {
                        Text("Award: Game Time")
                            .padding()
                            .background(Color.oliveGreen)
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
