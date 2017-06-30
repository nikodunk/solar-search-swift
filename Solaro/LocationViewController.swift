//
//  LocationViewController.swift
//  Solaro
//
//  Created by Nikolai Dunkel on 19.06.17.
//  Copyright © 2017 Nikolai Dunkel. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class LocationViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var counterView: UILabel!
//    @IBOutlet weak var solarPower: UILabel!
//    @IBOutlet weak var solarPrice: UILabel!
    
    
    var geoCoder : CLGeocoder! = CLGeocoder()
    var locationManager: CLLocationManager!
    var panelsInBasket = 120



    override func viewDidLoad() {
        super.viewDidLoad()
        
        //run the main functions
        determineCurrentLocation()
        self.mapView.delegate = self
    }
    
    
    func determineCurrentLocation(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        let center = userLocation.coordinate
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.0005, longitudeDelta: 0.0005))
        mapView.setRegion(region, animated: true)
        
        geoCode(userLocation: userLocation)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool){
        let userLocation = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
        geoCode(userLocation: userLocation)
    }
        
        
    func geoCode(userLocation: CLLocation!){
        geoCoder.cancelGeocode()
        geoCoder.reverseGeocodeLocation(userLocation) { (data, error) -> Void in
            guard let placeMarks = data as [CLPlacemark]! else { return }
            let loc: CLPlacemark = placeMarks[0]
            let addressDict: [NSString: NSObject] = loc.addressDictionary as! [NSString:NSObject]
            let addrList = addressDict["FormattedAddressLines"] as! [String]
            let addressGot = addrList.joined(separator: "\r")
            self.address.text = addressGot
        }
    }

    
    @IBAction func add(_ sender: Any) {
        panelsInBasket = panelsInBasket + 10
//        solarPower!.text = String(panelsInBasket*200) + " W"
//        solarPrice!.text = "$ " + String(panelsInBasket*632)
        counterView!.text = String(panelsInBasket)
    }
    
    
    @IBAction func remove(_ sender: Any) {
        panelsInBasket = panelsInBasket - 10
//        solarPower!.text = String(panelsInBasket*200) + " W"
//        solarPrice!.text = "$ " + String(panelsInBasket*632)
        counterView!.text = String(panelsInBasket)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        let resultsViewController = segue.destination as! ResultsViewController
        
        // set a variable in the second view controller with the String to pass
        resultsViewController.receivedAddress = address.text!
        resultsViewController.receivedAmount = String(panelsInBasket)
//        resultsViewController.receivedPower = solarPower.text!
//        resultsViewController.receivedPrice = solarPrice.text!
    }
    
    
    
}
