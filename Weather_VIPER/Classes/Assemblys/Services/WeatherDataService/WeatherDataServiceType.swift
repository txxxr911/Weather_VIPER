//
//  WeatherDataServiceType.swift
//  Weather_VIPER
//
//  Created by Victor on 07.03.2022
//	
//

import Foundation

protocol WeatherDataServiceType {
    func getWeatherData(coordinate: Coordinate, didGetWeatherData: @escaping (DecodeWeatherData) -> Void)
    //func getWeekWeather(coordinate: Coordinate, didGetWeatherData: @escaping ((WeatherDataForWeek) -> Void))
    func correctCity(coordinate: Coordinate, didGetCorrectCity: @escaping (CorrectCity) -> Void)
    func getWeekWeatherData(coordinate: Coordinate, didGetWeatherData: @escaping ((DecodeWeatherDataForWeek) -> Void))
}
