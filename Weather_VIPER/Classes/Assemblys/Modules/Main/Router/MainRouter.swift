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
    
    func showSecondView(coordinate: Coordinate) {
            let module = self.container.resolve(SecondAssembly.self).build(coordinate: coordinate, coordinator: self.coordinator)
             coordinator.router.push(module)
    }
        
}
