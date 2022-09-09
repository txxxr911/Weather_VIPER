//
//  ManagerType.swift
//  Weather_VIPER
//
//  Created by Victor on 23.03.2022
//	
//

import Foundation

protocol ManagerType {
    
    func map(data: DecodeWeatherDataForWeek, dataDidTransformed: @escaping (WeekWeatherData) -> Void)
}
