//
//  WeatherData.swift
//  Weather_VIPER
//
//  Created by Victor on 07.03.2022.
//

// Structs for current weather

import Foundation

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}
struct Main: Codable {
    var temp: Double = 0.0
    var pressure: Int = 0
    var humidity: Int = 0
    
}
struct WeatherData: Codable{
    var weather: [Weather] = []
    var main: Main = Main()
    var name: String = ""
}


struct Local_Names: Codable{
    var ru: String = ""
    
}

// MARK: For CorrectCityMethod

struct CorrectCity: Codable{
    var name: String = ""
    var local_names: Local_Names = Local_Names()
}

