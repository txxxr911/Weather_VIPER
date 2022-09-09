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
    
    var didGetWeatherData: ((DecodeWeatherData) -> Void)?
    var didGetCorrectCity: ((CorrectCity) -> Void)?
    var didGetWeatherForWeek: ((DecodeWeatherDataForWeek) -> Void)?
    
    
    func getWeekWeatherData(coordinate: Coordinate, didGetWeatherData: @escaping ((DecodeWeatherDataForWeek) -> Void)) {
        self.didGetWeatherForWeek = didGetWeatherData
        
        var decodeWeatherWeekData = DecodeWeatherDataForWeek()
        let session = URLSession.shared
        let url = URL(string:
                        "https://api.openweathermap.org/data/2.5/onecall?lat=\(coordinate.latitude)&lon=\(coordinate.longtitude)&exclude=hourly,minutely,current,alerts&appid=b34287a80809d4ed895cc829822b8622&units=metric&lang=ru")!
        let request = session.dataTask(with: url) { (data, responce, error) in
            guard error == nil else {
                print("Data task error: \(error!.localizedDescription)")
                return
            }
            do {
                let weatherData = try JSONDecoder().decode(WeatherDataForWeek.self, from: data!)
                
                let setData = DailyWeather()
                decodeWeatherWeekData.dailyWeather = [(DailyWeather)](repeating: setData, count: 7)
                
                var i = 0
                
               
                        for i in 0...6 {
                            decodeWeatherWeekData.dailyWeather[i].minTemperature = Int(round( weatherData.daily[i].temp.min))
                        decodeWeatherWeekData.dailyWeather[i].maxTemperature = Int(round(weatherData.daily[i].temp.max))
                        decodeWeatherWeekData.dailyWeather[i].iconName = weatherData.daily[i].weather[0].icon
                    }
                    
                self.didGetWeatherForWeek?(decodeWeatherWeekData)
        }
            catch {
                print(error)
            }
            }
        request.resume()
        }
    
    
    
    func getWeatherData(coordinate: Coordinate, didGetWeatherData: @escaping ((DecodeWeatherData) -> Void)) {
        self.didGetWeatherData = didGetWeatherData
        
        var decodeWeatherData = DecodeWeatherData()
        let session = URLSession.shared
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinate.latitude.description)&lon=\(coordinate.longtitude.description)&appid=7be9c969c5bf1dcbffb7e9de80e7be6d&units=metric&lang=ru")!
        let request = session.dataTask(with: url) { (data, response, error) in
        guard error == nil else {
            print("Data task error: \(error!.localizedDescription)")
            return
    }
            do {
                
               let weatherData = try JSONDecoder().decode(WeatherData.self, from: data!)
                decodeWeatherData.weatherIcon = weatherData.weather[0].icon
                decodeWeatherData.temperature = Int(round(weatherData.main.temp)).description
                decodeWeatherData.weatherDescription = DataSource.weatherIDs[weatherData.weather[0].id]!
                self.correctCity(coordinate: coordinate) { data in
                    decodeWeatherData.cityName = data.local_names.ru
                    
                    self.didGetWeatherData?(decodeWeatherData)
                }

            } catch  {
                print(error)
            }
        }
        request.resume()
        
      
    }
    
    
    func correctCity(coordinate: Coordinate, didGetCorrectCity: @escaping (CorrectCity) -> Void) {
        self.didGetCorrectCity = didGetCorrectCity
        
        let session = URLSession.shared
        let url = URL(string: "http://api.openweathermap.org/geo/1.0/reverse?lat=\(coordinate.latitude)&lon=\(coordinate.longtitude)&limit=10&appid=7be9c969c5bf1dcbffb7e9de80e7be6d")!
        let request = session.dataTask(with: url) { (data, response, error) in
        guard error == nil else {
            print("Data task error: \(error!.localizedDescription)")
            return
        }
            do {
                let rightData: [CorrectCity] = try JSONDecoder().decode([CorrectCity].self, from: data!)
                self.didGetCorrectCity?(rightData[0])
            } catch  {
                print(error)
            }
        }
        request.resume()
    }
}
