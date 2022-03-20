//
//  SecondAssembly.swift
//  Weather_VIPER
//
//  Created by Victor on 17.03.2022
//  
//

import UIKit

typealias SecondModule = Module<SecondModuleInput, SecondModuleOutput>

class SecondAssembly: Assembly {
    func build(coordinator: CoordinatorType) -> SecondModule {
        // View
        let view = SecondViewController.controllerFromStoryboard(.weekWeatherView)
        
        // Services
        let weatherDataService = container.resolve(WeatherDataServiceAssembly.self).build()
        let storageService = container.resolve(StorageServiceAssembly.self).build()
        
        // Interactor
        let interactor = SecondInteractor(weatherDataService: weatherDataService, storageService: storageService)
        
        // Router
        let router = SecondRouter(coordinator: coordinator)
        
        // Presenter
        let presenter = SecondPresenter(interactor: interactor, router: router)
        
        // Dependency Setup
        presenter.view = view
        view.output = presenter
        
        return Module(view: view, input: presenter, output: presenter)
    }
}
