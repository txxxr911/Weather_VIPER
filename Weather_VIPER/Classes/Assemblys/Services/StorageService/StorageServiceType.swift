//
//  StorageServiceType.swift
//  Weather_VIPER
//
//  Created by Victor on 07.03.2022
//	
//

import Foundation

protocol StorageServiceType {
    func saveWeatherData(weatherData: DecodeWeatherData,didSavedData: @escaping () -> Void )
}
