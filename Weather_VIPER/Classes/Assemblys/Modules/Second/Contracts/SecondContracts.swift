//
//  SecondContracts.swift
//  Weather_VIPER
//
//  Created by Victor on 17.03.2022
//  
//

import Foundation

// Module Input
protocol SecondModuleInput {
    
}

// Module Output
protocol SecondModuleOutput {
    
}

// View Input
protocol SecondViewInput: class {

}

// View Output
protocol SecondViewOutput: class {
    
    var weekWeatherData: WeekWeatherData? {get}
    func viewDidLoad(didGetData: @escaping () -> Void)
    func showWeekWeather()
}

// Interactor
protocol SecondInteractorInput {
    var weekWeatherData: WeekWeatherData? {get}
    
    func viewDidLoad(updateUI: @escaping () -> Void)
}

// Router
protocol SecondRouterProtocol: AlertRoutable {
    
}
