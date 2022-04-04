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
            
        }
    }
    
    func getCoordinate(didGetCoordinate : @escaping ((Coordinate) -> Void)) {
        self.didGetCoordinate = didGetCoordinate
            self.startLocationManager()
        
        
       
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let currentLocation = locations.last {
        print (currentLocation.coordinate.latitude, currentLocation.coordinate.longitude)
                let currentCoordinate: Coordinate = Coordinate(latitude: currentLocation.coordinate.latitude, longtitude: currentLocation.coordinate.longitude)
            locationManager.stopUpdatingLocation()
            didGetCoordinate?(currentCoordinate)
            didGetCoordinate = nil

        }
    }
    
    
}
