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
//import GlobalVariables


struct QueueView: View {
    @StateObject var viewModel = QueueViewModel()
    let travelTime = globalTravelTime
    
    private let userId: String
    
    init(userId:String) {
        self.userId = userId
        print("user ID is: \(userId)")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                
//                if let travelTime = globalTravelTime {
//                    Text("The travel time from earlier is: \(travelTime)")
//                        .padding(.bottom, 200)
//                }
                
                
                BusMapViewRepresentable()
                    .frame(height:800)
//                    .padding(.top, 50)
                    .padding(.bottom, 200)
            }
            
            
            .navigationTitle("Travel time: \(travelTime ?? 6) minutes")
            .toolbar {
//                Button {
                    //Action
//                } label : {
//                    Image(systemName: "plus")
//                }
            }
        }
    }
}

#Preview {
    QueueView(userId: "")
}
