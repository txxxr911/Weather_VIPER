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
    let coordinate: Coordinate
    let manager: ManagerType
    
    init(weatherDataService: WeatherDataServiceType, storageService: StorageServiceType, coordinate: Coordinate, manager: ManagerType) {
        self.weatherDataService = weatherDataService
        self.storageService = storageService
        self.coordinate = coordinate
        self.manager = manager
    }
    
    func viewDidLoad(updateUI: @escaping (WeekWeatherData) -> Void,  saveData: @escaping () -> Void) {
        print("interactor works")
        weatherDataService.getWeekWeatherData(coordinate: coordinate) { weatherData in
            self.manager.map(data: weatherData) { data in
                updateUI(data)
            }
            
        }
        
    }
}



// MARK: Private
extension SecondInteractor {
    
}
