//
//  DecodeWeatherDataForWeek.swift
//  Weather_VIPER
//
//  Created by Victor on 27.03.2022.
//

import Foundation

struct DailyWeather {
    var dayName: String = ""
    var minTemperature: Int = 0
    var maxTemperature: Int = 10
    var iconName: String = ""
}

struct DecodeWeatherDataForWeek {
    var cityName: String = ""
    var dailyWeather: [DailyWeather] = []
}


