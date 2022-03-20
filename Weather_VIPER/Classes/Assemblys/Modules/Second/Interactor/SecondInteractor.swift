//
//  SecondInteractor.swift
//  Weather_VIPER
//
//  Created by Victor on 17.03.2022
//  
//

import Foundation

class SecondInteractor: SecondInteractorInput {
    let weatherDataService: WeatherDataServiceType
    let storageService: StorageServiceType
    
    init(weatherDataService: WeatherDataServiceType, storageService: StorageServiceType) {
        self.weatherDataService = weatherDataService
        self.storageService = storageService
    }
    
    func viewDidLoad(updateUI: @escaping (DecodeWeatherData) -> Void,  saveData: @escaping () -> Void) {
      

//            self.weatherDataService.getWeatherData(coordinate: c) { weatherData in
//                DispatchQueue.main.sync {
//                    self.storageService.saveWeatherData(weatherData: weatherData) {
//                            saveData()
//                        }
//
//
//                updateUI(weatherData)
                
        //}
        //}
    }
}



// MARK: Private
extension SecondInteractor {
    
}
