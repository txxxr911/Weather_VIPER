//
//  SavedWeatherData.swift
//  Weather_VIPER
//
//  Created by Victor on 10.03.2022.
//

import Foundation
import RealmSwift

class SavedWeatherData: Object {
    @objc dynamic var cityName: String? = ""
    @objc dynamic var iconName: String? = ""
    @objc dynamic var temperature: String? = ""
    @objc dynamic var weatherDescription: String? = ""
          //dynamic var weatherForWeek: WeatherDataForWeek? = WeatherDataForWeek()
}
