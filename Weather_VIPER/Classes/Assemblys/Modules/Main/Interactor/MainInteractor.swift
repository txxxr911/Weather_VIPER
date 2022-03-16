//
//  MainInteractor.swift
//  Weather_VIPER
//
//  Created by Victor on 05.03.2022
//  
//

import Foundation

class MainInteractor: MainInteractorInput {

    let weatherDataService: WeatherDataServiceType
    let locationService: LocationServiceType
    let storageService: StorageServiceType
    
    init(locationService: LocationServiceType, weatherDataService: WeatherDataServiceType, storageService: StorageServiceType){
        self.locationService = locationService
        self.weatherDataService = weatherDataService
        self.storageService = storageService
    }
    
    func viewDidLoad(updateUI: @escaping (DecodeWeatherData) -> Void,  saveData: @escaping () -> Void) {
        locationService.getCoordinate { c in

            self.weatherDataService.getWeatherData(coordinate: c) { weatherData in
                DispatchQueue.main.sync {
                    self.storageService.saveWeatherData(weatherData: weatherData) {
                            saveData()
                        }
                }
            
                updateUI(weatherData)
                
            }
        }
    }
}

// MARK: - Private
extension MainInteractor {

}
