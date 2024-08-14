//
//  XULA_Shuttle_ServiceApp.swift
//  XULA Shuttle Service
//
//  Created by Kaleb Riley on 3/26/24.
//

import Foundation
import FirebaseCore
import SwiftUI
import GoogleMaps
import Firebase

@main
struct XULA_Shuttle_ServiceApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
//    init() {
//        FirebaseApp.configure()
//        GMSServices.provideAPIKey("AIzaSyC4BoLWluQd1dN5xuKA9KFujNh7M8Foc-8")
//    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let providerFactory = AppCheckDebugProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)
        
        FirebaseApp.configure()
//        GMSServices.provideAPIKey("")
        return true
    }
}
