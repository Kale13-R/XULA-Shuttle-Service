//
//  QueueView.swift
//  XULA Shuttle Service
//
//  Created by Kaleb Riley on 3/26/24.
//

import Foundation
import SwiftUI
import UIKit
import GoogleMaps

struct QueueView: View {
    @StateObject var viewModel = QueueViewModel()
    
    private let userId: String
    
    init(userId:String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                GoogleMapsView()
                    .frame(height:600)
                    .padding(.bottom, 50)
            }
            .navigationTitle("Bus Queues")
            .toolbar {
                Button {
                    //Action
                } label : {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    QueueView(userId: "")
}
