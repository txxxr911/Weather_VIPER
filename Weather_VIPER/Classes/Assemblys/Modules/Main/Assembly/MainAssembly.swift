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
        
        // Interactor
        let interactor = MainInteractor()
        
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
