//
//  MainView.swift
//  XULA Shuttle Service
//
//  Created by Kaleb Riley on 3/26/24.
//

import Foundation
import SwiftUI



struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
//        LoginView()
        if viewModel.isSignedIn,
           !viewModel.currentUserID.isEmpty {
            accountView
            
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            QueueView(userId: viewModel.currentUserID)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileVIew()
                .tabItem {
                    Label("Profile", systemImage:"person.circle")
                }
        }
    }
        
    }

#Preview {
    MainView()
}
