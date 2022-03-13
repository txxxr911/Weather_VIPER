//
//  MainInteractor.swift
//  Weather_VIPER
//
//  Created by Victor on 05.03.2022
//  
//

import Foundation

class MainInteractor: MainInteractorInput {
//    var currentCoordinate: Coordinate {
//        locationService.getCoordinate()
//    }
    
//    var currentWeather: EncodeWeatherData {
//            weatherDataService.getWeatherData(coordinate: currentCoordinate)
//        }
    
    let weatherDataService: WeatherDataServiceType
    let locationService: LocationServiceType
    let storageService: StorageServiceType
    
    init(locationService: LocationServiceType, weatherDataService: WeatherDataServiceType, storageService: StorageServiceType){
        self.locationService = locationService
        self.weatherDataService = weatherDataService
        self.storageService = storageService
    }
    
    func viewDidLoad(updateUI: @escaping (DecodeWeatherData) -> Void,  saveData: @escaping () -> Void) {
        print ("interactor get request and send it to services")
        locationService.getCoordinate { c in
            print("\(c.latitude) and \(c.longtitude)")
            print("to weatherdataservice")
            self.weatherDataService.getWeatherData(coordinate: c) { weatherData in
                print ("de data \(weatherData.cityName) \(weatherData.weatherIcon) \(weatherData.temperature) \(weatherData.weatherDescription)")
                print("to storage")
//            self.storageService.saveWeatherData(weatherData: weatherData) {
//                    saveData()
//                }
                updateUI(weatherData)
                
            }
        }
        print ("interactor send responce")
    }
    
//    func getWeatherData(coordinate: Coordinate) {
//
//    }
}

// MARK: - Private
extension MainInteractor {

}
