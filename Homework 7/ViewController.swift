//
//  ViewController.swift
//  Homework 7
//
//  Created by Kai Marshall on 4/12/20.
//  Copyright © 2020 Kai Marshall. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    let locMan: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    let kshuLatitude: CLLocationDegrees = 40.311
    let kshuLongtitude: CLLocationDegrees = -79.5567
    
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation:  CLLocation=locations[0]
        NSLog("Something is happening")
        
        if newLocation.horizontalAccuracy  >= 0 {
            let shu:CLLocation  = CLLocation(latitude: kshuLatitude, longitude: kshuLatitude)
            let delta:CLLocationDistance = shu.distance(from: newLocation)
            let miles:Double = (delta * 0.000621371)  + 0.5
            
            if miles < 3 {
                distanceLabel.text = "Welcome to Seton Hill"
            } else {
                let commaDelimited: NumberFormatter = NumberFormatter()
                commaDelimited.numberStyle = NumberFormatter.Style.decimal
                
                distanceLabel.text=commaDelimited.string(from: NSNumber(value: miles))!+"miles to Seton Hill"
            }
            func viewDidLoad() {
                locMan.delegate = self
                locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers
                locMan.distanceFilter = 1609;
                locMan.requestWhenInUseAuthorization()
                locMan.startUpdatingLocation()
                startLocation = nil
}
            
        
        


}
}
}
