//
//  LocationManager.swift
//  WeatherApp
//
//  Created by user229431 on 11/16/22.
//

import Foundation
import CoreLocation

/* This class is used to get the coordinates for the weather app*/

// in this version of the app we will be asking the permission to get location everytime the app is opened
// This can be fixed by reading documentation on "Adding Location Services to Your App" on Apple Developer page

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // Make a new "manager" and create a new instance of manager with 'CLLocationManager()
    let manager = CLLocationManager()
    
    // create 2 published variables & first one is optional to person using app if they decline use (? is what makes it optional bc it means maybe null)
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    // Create a few functions
    
    // 1st is overriding the initialization func and when we initialize we need to call the "super initialization"
    // then we will make "manager.self"
    override init() {
        super.init()
        manager.delegate = self
    }
    
    // this function is requesting a location to the manager instance
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    // this function is to make the manager CLLocation delegate work
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate      // The first location may not be there so we made it possibly bc it could be null hence '?'
        isLoading = false
    }
    
    // This function is used to handle errors
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
    
    
    
    
    
}
