//
//  MainCoordinator.swift
//  Weather_VIPER
//
//  Created by Victor on 05.03.2022
//  
//

import UIKit

class MainCoordinator: BaseCoordinator, MainCoordinatorType {
    
    override func start() {
        let module = container.resolve(MainAssembly.self).build(coordinator: self)
        router.setRootModule(module)
    }
    
    override func toPresent() -> UIViewController {
        return router.rootViewController!
    }
}

extension MainCoordinator {
    
    func secondViewController() -> UIViewController {
        let coordinator = container.resolve(SecondCoordinatorAssembly.self).build()
        self.addChild(coordinator)
        coordinator.start()
        return coordinator.toPresent()
    }
}
