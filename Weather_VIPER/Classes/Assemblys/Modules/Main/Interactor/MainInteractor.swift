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
    
    var currentCoordinate: Coordinate
    
    init(locationService: LocationServiceType, weatherDataService: WeatherDataServiceType, storageService: StorageServiceType, currentCoordinate: Coordinate) {
        self.locationService = locationService
        self.weatherDataService = weatherDataService
        self.storageService = storageService
        self.currentCoordinate = currentCoordinate
    }
    
    
    func viewDidLoad(updateUI: @escaping (DecodeWeatherData) -> Void,  saveData: @escaping () -> Void) {
        locationService.getCoordinate { coordinate in

            self.currentCoordinate = coordinate
            self.weatherDataService.getWeatherData(coordinate: coordinate) { weatherData in
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
