//
//  MainRouter.swift
//  Weather_VIPER
//
//  Created by Victor on 05.03.2022
//  
//

import Foundation

class MainRouter: BaseModuleRouter, MainRouterProtocol {

    func dismiss() {
        coordinator.completion?()
    }
    
    func showSecondView() {
        let module = container.resolve(SecondAssembly.self).build(coordinator: coordinator)
        coordinator.router.push(module)
    }
}
