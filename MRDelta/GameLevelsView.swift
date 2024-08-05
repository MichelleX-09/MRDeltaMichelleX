//
//  GameLevelsView.swift
//  MRDelta
//
//  Created by Zhifu Xie on 8/4/24.
//
import SwiftUI

struct GameLevelsView: View {
    var earnedPoints: Int
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                Text("Select a Game Level")
                    .font(.largeTitle)
                    .padding()

                if earnedPoints >= 0 {
                    NavigationLink(destination: GameView(level: 1)) {
                        Text("Level 1")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }
                
                if earnedPoints >= 500 {
                    NavigationLink(destination: GameView(level: 2)) {
                        Text("Level 2")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }
                
                if earnedPoints >= 1501 {
                    NavigationLink(destination: GameView(level: 3)) {
                        Text("Level 3")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }
                
                if earnedPoints >= 5001 {
                    NavigationLink(destination: GameView(level: 4)) {
                        Text("Level 4")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }
                
                if earnedPoints >= 10001 {
                    NavigationLink(destination: GameView(level: 5)) {
                        Text("Level 5")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }

                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Back")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
        }
    }
}
