////
////  PlacesViewController.swift
////  GoogleMapsApp
////
////  Created by Admin on 7/13/17.
////  Copyright © 2017 ChungSama. All rights reserved.
////
//
//import UIKit
//import GooglePlaces
//
//class PlacesViewController: UIViewController {
//
//    @IBOutlet weak var tableView: UITableView!
//    
//     // An array to hold the list of possible locations.
//    var likelyPlaces: [GMSPlace] = []
//    var selectedPlace: GMSPlace?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Register the table view cell class and its reuse id.
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        
//        tableView.reloadData()
//    }
//
//    
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "unwindToMain" {
//            if let nextViewController = segue.destination as? MapsViewController {
//                nextViewController.selectedPlaces = selectedPlace
//            }
//        }
//    }
//}
//// Respond when a user selects a place.
//extension PlacesViewController: UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        selectedPlace = likelyPlaces[indexPath.row]
//        performSegue(withIdentifier: "unwindToMain", sender: self)
//    }
//    
//    // Adjust cell height to only show the first five items in the table
//    // (scrolling is disabled in IB).
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return self.tableView.frame.size.height/5
//    }
//    
//    // Make table rows display at proper height if there are less than 5 items.
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        if (section == tableView.numberOfSections - 1) {
//            return 1
//        }
//        return 0
//    }
//}
//extension PlacesViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return likelyPlaces.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        let collectionItem = likelyPlaces[indexPath.row]
//        cell.textLabel?.text = collectionItem.name
//        return cell
//    }
//}
