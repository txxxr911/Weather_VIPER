//
//  StorageService.swift
//  Weather_VIPER
//
//  Created by Victor on 07.03.2022
//	
//

import Foundation
import RealmSwift

class StorageService: StorageServiceType {
    let realm = try! Realm()
    var didSavedData: (() -> Void)?
    func saveWeatherData(weatherData: DecodeWeatherData, didSavedData: @escaping () -> Void ) {
        
        self.didSavedData = didSavedData
        
        let data = SavedWeatherData()
        
        try! realm.write{
            data.cityName = weatherData.cityName
            data.iconName = weatherData.weatherIcon
            data.temperature = weatherData.temperature
            data.weatherDescription = weatherData.weatherDescription
            //data.weatherForWeek = weatherData.weekWeatherData
            realm.add(data)
            
        }
    didSavedData()
    }
}
