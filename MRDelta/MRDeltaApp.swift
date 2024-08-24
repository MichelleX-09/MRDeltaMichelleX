//
//  MRDeltaApp.swift
//  MRDelta
//
//  Created by Zhifu Xie on 7/17/24.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore


@main
struct MRDeltaTry1App: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
