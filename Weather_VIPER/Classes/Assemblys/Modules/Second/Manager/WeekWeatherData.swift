//
//  WeekWeatherData.swift
//  Weather_VIPER
//
//  Created by Victor on 23.03.2022.
//

import Foundation

struct WeekWeatherData {
    var weekWeatherData: [DayData] = []
}

struct DayData {
    var cityName: String = ""
    var dayOfWeek: String = ""
    var minTemperature: Int = 0
    var iconName: String = ""
    var maxTemperature: Int = 10
    
}
