//
//  XSButton.swift
//  XULA Shuttle Service
//
//  Created by Kaleb Riley on 3/26/24.
//

import SwiftUI

struct XSButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
            // action
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    XSButton(title: "value", background: .yellow) {
        //action
    }
}
