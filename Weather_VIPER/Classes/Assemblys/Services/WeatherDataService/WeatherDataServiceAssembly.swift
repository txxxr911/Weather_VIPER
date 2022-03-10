//
//  WeatherDataServiceAssembly.swift
//  Weather_VIPER
//
//  Created by Victor on 07.03.2022
//	
//

import Foundation

class WeatherDataServiceAssembly: Assembly {
    func build() -> WeatherDataServiceType {
        let service = WeatherDataService()
        return service
    }
}
