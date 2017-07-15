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

class MapsViewController: UIViewController {
    // Initialize the location manager.
    var locationManager: CLLocationManager = {
        var locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        return locationManager
    }()
    var marker = GMSMarker()
    var currentLocation: CLLocation?
    var mapView: GMSMapView!
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    
    // An array to hold the list of likely places.
    var likelyPlaces: [GMSPlace] = []
    
    // The current selected places.
    var selectedPlaces: GMSPlace?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        mapViewSetting()
    }
    
    // MapView settings
    func mapViewSetting() {
        mapView.settings.myLocationButton = true
        mapView.settings.indoorPicker = true
        mapView.settings.compassButton = true
        view.addSubview(mapView)
    }
}


// Delegates to handle events for the location manager.
extension MapsViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == CLAuthorizationStatus.authorizedWhenInUse) {
            mapView.isMyLocationEnabled = true
        }
    }
    
    // Handle incoming location events.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: zoomLevel)
        mapView = GMSMapView.map(withFrame: view.bounds, camera: camera)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        marker.position = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        marker.title = "Your location"
        marker.map = self.mapView
    }
    
    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error\(error)")
        locationManager.stopUpdatingLocation()
    }
}

