//
//  LocationService.swift
//  Weather_VIPER
//
//  Created by Victor on 06.03.2022
//	
//

import Foundation
import CoreLocation

class LocationService: NSObject, LocationServiceType, CLLocationManagerDelegate {
	
    let locationManager = CLLocationManager()
    private var currentCoordinate: Coordinate? = nil
    
    var didGetCoordinate : ((Coordinate) -> Void )?
    
    func startLocationManager(){
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            locationManager.pausesLocationUpdatesAutomatically = true
            locationManager.startUpdatingLocation()
            print ("Location manager has been started")
            
        }
    }
    
    func getCoordinate(didGetCoordinate : @escaping ((Coordinate) -> Void)) {
        print("location service get request and start working")
        self.didGetCoordinate = didGetCoordinate
            self.startLocationManager()
        
        
       
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let currentLocation = locations.last {
            print (currentLocation.coordinate.latitude, currentLocation.coordinate.longitude)
                let currentCoordinate: Coordinate = Coordinate(latitude: currentLocation.coordinate.latitude, longtitude: currentLocation.coordinate.longitude)
            print("location service send responce")
            didGetCoordinate?(currentCoordinate)
            didGetCoordinate = nil
            
                //self.currentCoordinate = didGetCoordinate(currentCoordinate)
            
            locationManager.stopUpdatingLocation()
        }
    }
    
    
}
