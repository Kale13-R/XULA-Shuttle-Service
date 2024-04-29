//
//  LoginView.swift
//  XULA Shuttle Service
//
//  Created by Kaleb Riley on 3/26/24.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct LoginView: View {
   @StateObject var viewModel = LoginViewModel()

    
    var body: some View {
        NavigationView {
            VStack {
    //            Header goes here
                HeaderView(title: "Xula Transport",
                           subtitle: "Organized XULA Transportation",
                           angle: 15,
                           background: .yellow)


    //            Login goes here
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none) //pw auto caps and stuff dont need
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    XSButton(
                        title: "Log In",
                        background: .blue)
                    {
                
                            viewModel.login()
                    }
//                    .padding()

                }
                .offset(y:-50)
    //            Create Account here
                
                VStack {
                    Text("New to XULA Shuttles?")
            
                        // show reg
                    
                    NavigationLink("Create An Account.", destination: RegistrationView())
                }
                .padding(.bottom,50)
                Spacer()
            }
            
        }
        

    }
}

#Preview {
    LoginView()
}
