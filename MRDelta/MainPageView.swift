//
//  MainPageView.swift
//  MRDelta
//
//  Created by Zhifu Xie on 8/4/24.
//

import SwiftUI

struct MainPageView: View {
    var body: some View {
        NavigationStack {
            ZStack{
                VStack {
                    Image("MRDeltaLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 180)
                        .padding(.bottom, 10)
                    
                    Text("Together, we can make a difference.")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.bottom, 20)
                
                    VStack(spacing: 20){
                        NavigationLink(destination: DeltaExplorationView()) {
                            Text("Delta Explorer")
                                .padding()
                                .background(Color.oliveGreen)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        
                        NavigationLink(destination: DeltaRivalCampaignView()) {
                            Text("Delta Revival Campaign")
                                .padding()
                                .background(Color.oliveGreen)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        
                        NavigationLink(destination: VolunteerOpportunityView()) {
                            Text("Volunteer Opportunity")
                                .padding()
                                .background(Color.oliveGreen)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
 
                        NavigationLink(destination: ProfileView()) {
                            Text("Profile")
                                .padding()
                                .background(Color.oliveGreen)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                }
                .navigationTitle("Home Page")
                .padding()
                .background(Color.palepink.ignoresSafeArea())
            }
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
