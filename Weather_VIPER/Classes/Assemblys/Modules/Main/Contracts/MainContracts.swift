//
//  MainContracts.swift
//  Weather_VIPER
//
//  Created by Victor on 05.03.2022
//  
//

import UIKit

// Module Input
protocol MainModuleInput {
    
}

// Module Output
protocol MainModuleOutput: ModuleOutput {
    
}

// View Input
protocol MainViewInput: AnyObject {
    func set(weatherData: WeatherData)
}

// View Output
protocol MainViewOutput: AnyObject {
    func viewDidLoad(updateUI: @escaping (DecodeWeatherData) -> Void)
    
}

// Interactor
protocol MainInteractorInput {
    func viewDidLoad(updateUI: @escaping (DecodeWeatherData) -> Void, saveData: @escaping () -> Void)

}

// Router
protocol MainRouterProtocol: AlertRoutable {

}
