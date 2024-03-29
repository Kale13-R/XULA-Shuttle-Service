//
//  MainViewModel.swift
//  XULA Shuttle Service
//
//  Created by Kaleb Riley on 3/26/24.
//

import FirebaseAuth
import Foundation

class MainViewModel: ObservableObject {
    @Published var currentUserID: String = ""
    private var handler: AuthStateDidChangeListenerHandle? //since it is nil by default we need ?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in //weak self used to stop memeory leakage
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
