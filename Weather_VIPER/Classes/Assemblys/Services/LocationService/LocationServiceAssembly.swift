//
//  LocationServiceAssembly.swift
//  Weather_VIPER
//
//  Created by Victor on 06.03.2022
//	
//

import Foundation

class LocationServiceAssembly: Assembly {
    func build() -> LocationServiceType {
        let service = LocationService()
        return service
    }
}
