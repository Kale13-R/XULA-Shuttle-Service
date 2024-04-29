//
//  GoogleMapsView.swift
//  XULA Shuttle Service
//
//  Created by Kaleb Riley on 3/26/24.
//

import SwiftUI
import GoogleMaps
import MapKit
import CoreLocation

struct BusMapViewRepresentable: UIViewRepresentable {
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation.title == "UC Horseshoe" {
                let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "busAnnotation")
                annotationView.image = UIImage(systemName: "bus")
//                annotationView.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
                var globalTravelTime: Int?
                annotationView.canShowCallout = true  // Enable callout
                print("canShowCallout is: ", annotationView.canShowCallout)
                let detailLabel = UILabel()
                detailLabel.numberOfLines = 0
                detailLabel.font = detailLabel.font.withSize(12)
                detailLabel.text = annotation.subtitle!
                annotationView.detailCalloutAccessoryView = detailLabel
                return annotationView
                
            }
            return nil
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = .blue
                renderer.lineWidth = 4
                return renderer
            }
            return MKOverlayRenderer()
        }
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        //        let locationManager = LocationManager()
        
        
        map.delegate = context.coordinator
        map.isRotateEnabled = false
        map.showsUserLocation = true
        map.userTrackingMode = .follow
        
        let horseshoeCoord = CLLocationCoordinate2D(latitude: 29.962966, longitude: -90.10592)
        let UChorseshoe = MKPointAnnotation()
        UChorseshoe.coordinate = horseshoeCoord
        UChorseshoe.title = "UC Horseshoe"
        map.addAnnotation(UChorseshoe)
        
        @ObservedObject var locationManager = LocationManager()
        let currentLocation = locationManager.currentLocation
        //        CLLocationCoordinate2D(currentLocation)
        
        let NCF = CLLocationCoordinate2D(latitude: 29.965612366764464, longitude: -90.10835319757462)
        let normanC = MKPointAnnotation()
        normanC.coordinate = NCF
        normanC.title = "Norman C. Francis"
        map.addAnnotation(normanC)
        
        
        let userPlacemark = MKPlacemark(coordinate: NCF)
        let destPlacemark = MKPlacemark(coordinate: horseshoeCoord)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: userPlacemark)
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: horseshoeCoord))
        //        request.arrivalDate
        request.transportType = .walking
        //        var expectedTravelTime: TimeInterval { get }
        
        
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard let route = response?.routes.first else {
                if let error = error {
                    
                    print("Failed to get directions\(error.localizedDescription)")
                }
                
                return
            }
            globalTravelTime = Int(route.expectedTravelTime / 60)
            
            print(route.expectedTravelTime)
            UChorseshoe.subtitle = "Travel time: \(Int(route.expectedTravelTime / 60)) minutes" // Convert to minutes
            print("Subtitle after setting:", UChorseshoe.subtitle) // Check again
            map.addOverlay(route.polyline)
            map.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            map.setCameraZoomRange(MKMapView.CameraZoomRange(minCenterCoordinateDistance: 20, maxCenterCoordinateDistance: 1000), animated: false)
            
            
            
        }
        
        
        return map
    }
}
