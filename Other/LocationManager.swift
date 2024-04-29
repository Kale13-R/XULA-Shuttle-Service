//
//  LocationManager.swift
//  XULA Shuttle Service
//
//  Created by Kaleb Riley on 4/18/24.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    @Published var currentLocation : CLLocationCoordinate2D?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
//        locationManager.location
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:
                         [CLLocation]) {
        guard !locations.isEmpty else { return }
//        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        if let coordinate = locations.first?.coordinate {  // Extract the coordinate
            currentLocation = coordinate
            locationManager.stopUpdatingLocation()
        }
    }
}
