//
//  MapViewController.swift
//  XULA Shuttle Service
//
//  Created by Kaleb Riley on 4/15/24.
//

import GoogleMaps
import UIKit

private var apiKey: String {
    get {
        guard let filePath = Bundle.main.path(forResource: "GoogleService-Info",ofType: "plist") else {
            fatalError("Couldnt find plist file")
        }
        
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey:"API_KEY")as? String else {
            fatalError("Couldn't find key 'API_KEY' in plist file")
        }
        return value
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey(apiKey)
        
        let camera = GMSCameraPosition.camera(withLatitude:29.962966,longitude:-90.10592,zoom:18.0)
        let mapView = GMSMapView.map(withFrame: view.frame, camera:camera)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 29.962966, longitude: -90.10592)
        marker.title = "Xavier"
        marker.snippet = "Pickup/DropOff"
        marker.map = mapView
    }
}
