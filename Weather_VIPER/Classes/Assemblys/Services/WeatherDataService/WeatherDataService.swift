//
//  WeatherDataService.swift
//  Weather_VIPER
//
//  Created by Victor on 07.03.2022
//	
//

import Foundation
import Network

class WeatherDataService: WeatherDataServiceType {
    
    private var currenweatherData: DecodeWeatherData? = nil
    var didGetWeatherData: ((DecodeWeatherData) -> Void)?
    var didGetCorrectCity: ((CorrectCity) -> Void)?
    
    
    
    func getWeatherData(coordinate: Coordinate, didGetWeatherData: @escaping (DecodeWeatherData) -> Void) {
        print("weatherDataService get request and start working")
        
        var decodeWeatherData = DecodeWeatherData()
        self.didGetWeatherData = didGetWeatherData
        let session = URLSession.shared
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinate.latitude.description)&lon=\(coordinate.longtitude.description)&appid=7ecd06499c4370fe484ef26aff81cc5c&units=metric&lang=ru")!
        let request = session.dataTask(with: url) { (data, response, error) in
        guard error == nil else {
            print("Data task error: \(error!.localizedDescription)")
            return
        }
            do {
                //let weatherData: WeatherData
               let weatherData = try JSONDecoder().decode(WeatherData.self, from: data!)
                decodeWeatherData.weatherIcon = weatherData.weather[0].icon
                decodeWeatherData.temperature = weatherData.main.temp.description
                decodeWeatherData.weatherDescription = DataSource.weatherIDs[weatherData.weather[0].id]!
                self.correctCity(coordinate: coordinate) { b in
                    decodeWeatherData.cityName = b.local_names.ru
                }

            } catch  {
                print(error)
            }
        }
        request.resume()
        
        didGetWeatherData(decodeWeatherData)
        
        print("weatherDataService send responce")
      
    }
    
    func correctCity(coordinate: Coordinate, didGetCorrectCity: @escaping (CorrectCity) -> Void) {
        self.didGetCorrectCity = didGetCorrectCity
        
        let session = URLSession.shared
        let url = URL(string: "http://api.openweathermap.org/geo/1.0/reverse?lat=\(coordinate.latitude)&lon=\(coordinate.longtitude)&limit=10&appid=7ecd06499c4370fe484ef26aff81cc5c")!
        let request = session.dataTask(with: url) { (data, response, error) in
        guard error == nil else {
            print("Data task error: \(error!.localizedDescription)")
            return
        }
            do {
                let rightData: [CorrectCity] = try JSONDecoder().decode([CorrectCity].self, from: data!)
                didGetCorrectCity(rightData[0])
            } catch  {
                print(error)
            }
        }
        request.resume()
    }
}
