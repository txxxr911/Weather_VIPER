//
//  MainAssembly.swift
//  Weather_VIPER
//
//  Created by Victor on 05.03.2022
//  
//

import UIKit

typealias MainModule = Module<MainModuleInput, MainModuleOutput>

class MainAssembly: Assembly {
    func build(coordinator: CoordinatorType) -> MainModule {
        
        // View
        let view = MainViewController.controllerFromStoryboard(.main)
        
        // Services
        let locationService = container.resolve(LocationServiceAssembly.self).build()
        let weatherDataService = container.resolve(WeatherDataServiceAssembly.self).build()
        let storageService = container.resolve(StorageServiceAssembly.self).build()
        
        // Interactor
        let interactor = MainInteractor(locationService: locationService, weatherDataService: weatherDataService, storageService: storageService)
        
        // Router
        let router = MainRouter(coordinator: coordinator)
        
        // Presenter
        let presenter = MainPresenter(interactor: interactor, router: router)
        
        // Dependency Setup
        presenter.view = view
        view.output = presenter
        
        
        
        return Module(view: view, input: presenter, output: presenter)
    }
}
