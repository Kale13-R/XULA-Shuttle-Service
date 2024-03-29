//
//  GoogleMapsView.swift
//  XULA Shuttle Service
//
//  Created by Kaleb Riley on 3/26/24.
//

import SwiftUI
import GoogleMaps

struct GoogleMapsView: UIViewRepresentable {
    func makeUIView(context: Context) -> GMSMapView {
        let mapID = GMSMapID(identifier: "d37c27740e12d392")
        let camera = GMSCameraPosition.camera(withLatitude: 29.962966, longitude: -90.10592, zoom: 18.0)
//        let mapView = GMSMapView(frame: .zero, mapID: mapID,camera: camera)
        return GMSMapView(frame: .zero,mapID: mapID, camera: camera)
    }

    func updateUIView(_ uiView: GMSMapView, context: Context) {
        // Add map customization code here if needed
    }
}
