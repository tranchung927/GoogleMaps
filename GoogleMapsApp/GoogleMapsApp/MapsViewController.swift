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
    
    var currentLocation: CLLocation?
    var mapView: GMSMapView!
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    
    // An array to hold the list of likely places.
    var likelyPlaces: [GMSPlace] = []
    
    // The current selected places.
    var selectedPlaces: GMSPlace?
    
    // A default location to use when location permission is not granted.
    let defaultLocation = CLLocation(latitude: -33.869405, longitude: 151.199)
    
    // Update the map once the user has made their selection
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        // Clear map
        mapView.clear()
        
        // Add a marker to the map
        if selectedPlaces != nil {
            let marker = GMSMarker(position: (self.selectedPlaces?.coordinate)!)
            marker.title = selectedPlaces?.name
            marker.snippet = selectedPlaces?.formattedAddress
            marker.map = mapView
        }
        
        listLikePlaces()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        

        // Do any additional setup after loading the view.
    }

    func listLikePlaces() {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
