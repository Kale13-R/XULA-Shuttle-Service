//
//  LoginViewModel.swift
//  XULA Shuttle Service
//
//  Created by Kaleb Riley on 3/26/24.
//

import Foundation
import FirebaseAuth // maybe needs to be firebaseAUth
import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
//    @published private isSignedIn = false
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        print("called")
        
        //Try to login
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                      guard let strongSelf = self else { return }
//
//        NavigationLink(destination: QueueView(userId: userid)) {
//            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
//              guard let strongSelf = self else { return }
//               ...
//
//            }
//            Auth.auth().signIn(withEmail: email, password: password) { result, error in
//                if error != nil {
//                    self.errorMessage = "invalid email/password"
//                } else {
//
//                }
            }

        }
            

        private func validate() -> Bool {
            guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                  !password.trimmingCharacters(in: .whitespaces).isEmpty else { // Guard allows for easier early returns, in this case the early return of my function if there is not email/ pass
            errorMessage = "Please complete all fields"
            return false
            
        }
        
        guard email.contains("@xula.edu") else {
        errorMessage = "Enter a valid Xula email."
            return false
    }
        return true
        
    }
}
