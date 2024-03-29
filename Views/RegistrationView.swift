//
//  RegistrationView.swift
//  XULA Shuttle Service
//
//  Created by Kaleb Riley on 3/26/24.
//

import Foundation
import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    var body: some View {
        VStack {
            //header
            HeaderView(title: "Register",
                       subtitle: "Sign up using your XULA Email now!",
                       angle: -15,
                       background: .green)
            
            
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("XULA email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                XSButton(title: "Create Account",
                         background: .green
                ) {
                    //attempt to register
                    viewModel.register()
                }
                .padding()
            }
            .offset(y:-50)
            
        }
    }
}

#Preview {
    RegistrationView()
}
