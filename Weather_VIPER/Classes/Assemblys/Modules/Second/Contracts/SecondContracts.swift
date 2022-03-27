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
    func viewDidLoad(updateUI: @escaping (WeekWeatherData) -> Void)
    func showWeekWeather()
}

// Interactor
protocol SecondInteractorInput {
    
    func viewDidLoad(updateUI: @escaping (WeekWeatherData) -> Void, saveData: @escaping () -> Void)
}

// Router
protocol SecondRouterProtocol: AlertRoutable {
    
}
