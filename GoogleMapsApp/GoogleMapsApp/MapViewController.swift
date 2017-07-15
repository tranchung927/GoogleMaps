//
//  MapsViewController.swift
//  GoogleMapsApp
//
//  Created by Admin on 7/13/17.
//  Copyright © 2017 ChungSama. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapViewController: UIViewController {
    @IBOutlet weak var mapViewCustom: GMSMapView!
    
    // Initialize the location manager.
    var locationManager: CLLocationManager = {
        var locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 500
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            locationManager.startUpdatingHeading()
        }
        return locationManager
    }()
    var zoomLevel: Float = 15.0
    
    var marker = GMSMarker()
//    var currentLocation: CLLocation?
//    var mapView: GMSMapView!
//    var placesClient: GMSPlacesClient!

//
//    // An array to hold the list of likely places.
//    var likelyPlaces: [GMSPlace] = []
//    
//    // The current selected places.
//    var selectedPlaces: GMSPlace?
//    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
    }
}

extension MapViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            mapViewCustom.isMyLocationEnabled = true
            mapViewCustom.settings.myLocationButton = true
            marker.map = self.mapViewCustom
            
            mapViewCustom.camera = GMSCameraPosition(target: location.coordinate, zoom: zoomLevel, bearing: 0, viewingAngle: 0)
            
            marker.position = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
            
            marker.title = "Your location"
            marker.snippet = "Population: 8,174,100"
            
            
            
            // Tinh chinh mui ten chi vi tri
                // Vị trí mũi tên so với điểm vị trí
            marker.groundAnchor = CGPoint(x: 0.5, y: 0.5)
                // Góc mũi tên
            marker.rotation = 90.0
                // Màu
            marker.icon = GMSMarker.markerImage(with:.black)
                // Độ mờ
            marker.opacity = 0.5
            
            
            locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error\(error)")

    }
}
