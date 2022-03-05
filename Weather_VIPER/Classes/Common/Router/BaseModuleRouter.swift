//
//  BaseModuleRouter.swift
//  Weather_VIPER
//
//  Created by Victor on 05.03.2022
//  
//

import UIKit

protocol BaseModuleRoutable {
    var coordinator: CoordinatorType! {set get}
    var container: Container {set get}
}

class BaseModuleRouter: BaseModuleRoutable {
    weak var coordinator: CoordinatorType!
    var container: Container
    
    init(coordinator: CoordinatorType) {
        self.coordinator = coordinator
        self.container = coordinator.container
    }
}

extension BaseModuleRouter: Presentable {
    func toPresent() -> UIViewController {
        return coordinator.toPresent()
    }
}
