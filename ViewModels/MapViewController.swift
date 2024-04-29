//
//  MapViewController.swift
//  XULA Shuttle Service
//
//  Created by Kaleb Riley on 4/15/24.
//

import GoogleMaps
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey("your api key")
        
        let camera = GMSCameraPosition.camera(withLatitude:29.962966,longitude:-90.10592,zoom:18.0)
        let mapView = GMSMapView.map(withFrame: view.frame, camera:camera)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 29.962966, longitude: -90.10592)
        marker.title = "Xavier"
        marker.snippet = "Pickup/DropOff"
        marker.map = mapView
    }
}
