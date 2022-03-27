//
//  Manager.swift
//  Weather_VIPER
//
//  Created by Victor on 23.03.2022
//	
//

import Foundation

class Manager: ManagerType {
    
    var dataDidTransformed: ((WeekWeatherData) -> Void)?
    
    func map(data: DecodeWeatherDataForWeek, dataDidTransformed: @escaping (WeekWeatherData) -> Void) {
        self.dataDidTransformed = dataDidTransformed
        
        var weatherData = WeekWeatherData()
        
        let date = Date()
        let calendar = Calendar.current
        var weekDay = calendar.component(.weekday, from: date)
        
        var dayName: String
        var dayNameArray: [String] = []
        
        
        var i = 0
        while(true) {
            if (i < 7) {
                if weekDay > 7 {weekDay = weekDay - 7 }
                switch weekDay {
                case 1: dayName = "Воскресенье"
                case 2: dayName = "Понедельник"
                case 3: dayName = "Вторник"
                case 4: dayName = "Среда"
                case 5: dayName = "Четверг"
                case 6: dayName = "Пятница"
                case 7: dayName = "Суббота"
                default: return
                }
                dayNameArray[i] = dayName
                i += 1
                weekDay += 1
            }
            else {break}
        }
        
        var counter = 0
        while(counter<7) {
            weatherData.weekWeatherData[counter].dayOfWeek = dayNameArray[counter]
            weatherData.weekWeatherData[counter].minTemperature = data.dailyWeather[counter].minTemperature
            weatherData.weekWeatherData[counter].maxTemperature = data.dailyWeather[counter].maxTemperature
            weatherData.weekWeatherData[counter].iconName = data.dailyWeather[counter].iconName
        }
        self.dataDidTransformed?(weatherData)
    }
    
}
