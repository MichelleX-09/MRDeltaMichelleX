//
//  ContentView.swift
//  MRDelta
//
//  Created by Zhifu Xie on 7/17/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false
    @State private var isOrganizationUser = false

    var body: some View {
        NavigationView {
            if isLoggedIn {
                if isOrganizationUser {
                    AdvertisementUploadView()
                } else {
                    MainPageView()
                }
            } else {
                WelcomeView(isLoggedIn: $isLoggedIn, isOrganizationUser: $isOrganizationUser)
            }
        }
    }
}
