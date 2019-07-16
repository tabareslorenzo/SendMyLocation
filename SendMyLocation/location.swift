//
//  location.swift
//  SendMyLocation
//
//  Created by Lorenzo Tabares on 7/6/19.
//  Copyright © 2019 Lorenzo Tabares. All rights reserved.
//

import Foundation
import CoreLocation

let locationManager = CLLocationManager()
//let BaseURL = "https://www.googleapis.com/geolocation/v1/geolocate?key="
class location{
    func enableLocationServices()->Bool {
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            // Request when-in-use authorization initially
            locationManager.requestWhenInUseAuthorization()
            return false;
            break
            
        case .restricted, .denied:
            // Disable location features
            return false;
            break
            
        case .authorizedWhenInUse:
            // Enable basic location features
            locationManager.startUpdatingLocation()
            return true;
            break
            
        case .authorizedAlways:
            // Enable any of your app's location features
            locationManager.startUpdatingLocation()
            return true;
            break
        }
    }
    
    func AuthStatus() -> (Bool,String) {
        if(CLLocationManager.locationServicesEnabled())
        {
            if(self.enableLocationServices())
            {
                print("location servies are enable this application")
//                locationManager.requestLocation()
//                 print(locationManager.)
                print(locationManager.location?.coordinate.latitude)
                let lat = locationManager.location?.coordinate.latitude
                print(locationManager.location?.coordinate.longitude)
                let long = locationManager.location?.coordinate.longitude
                //let loc = "latitude: \(lat) longitude:\(long)"
                let loc = "\(lat.unsafelyUnwrapped),\(long.unsafelyUnwrapped)"
                print(loc)
//                let path = "https://www.google.com/maps/search/?api=1&query="+loc
//                print(path)
//                let url = URL(string: path)
//                //let url = URL(fileReferenceLiteralResourceName: path)
//                print(url.unsafelyUnwrapped)
//                CLLocationManager.loca(CLLocationManager)
                return(true, loc)
            }
            else{
                print(CLLocationManager.authorizationStatus().rawValue)
                print("Please Authorize location services for this app")
                return(false, "Please Authorize location services for this app")
            }
        }
        else{
            print("Please enable location services for apps")
            return(false,"Please enable location services for apps")
        }
        
    }
}


