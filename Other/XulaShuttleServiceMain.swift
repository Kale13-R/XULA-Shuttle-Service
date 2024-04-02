//
//  XulaShuttleServiceMain.swift
//  XULA Shuttle Service
//
//  Created by Kaleb Riley on 4/2/24.
//

import Foundation
import FirebaseCore
import SwiftUI
import GoogleMaps

@main
struct XulaShuttleServiceMain: App {
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
        FirebaseApp.configure()
        GMSServices.provideAPIKey("AIzaSyB9-PRq_aAjtruhMk09elnykJSZduaOUME")
        return true
    }
}
