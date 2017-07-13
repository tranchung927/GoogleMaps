//
//  MapsVC.swift
//  GoogleMapsApp
//
//  Created by Admin on 7/13/17.
//  Copyright © 2017 ChungSama. All rights reserved.
//

import UIKit
import GoogleMaps

class MapsVC: UIViewController {

    // You don't need to modify the default init(nibName:bundle:) method.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let market = GMSMarker()
        market.position = CLLocationCoordinate2DMake(-33.86, 151.20)
        market.title = "Sydney"
        market.snippet = "Australia"
        market.map = mapView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
