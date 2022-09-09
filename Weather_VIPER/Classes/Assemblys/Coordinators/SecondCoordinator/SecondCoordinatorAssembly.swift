//
//  SecondCoordinatorAssembly.swift
//  Weather_VIPER
//
//  Created by Victor on 20.03.2022
//	
//

import UIKit

class SecondCoordinatorAssembly: Assembly {
    func build() -> SecondCoordinatorType {
        let navigationController = UINavigationController(rootViewController: UIViewController())
        let router = Router(navigationController: navigationController)
        let coordinator = SecondCoordinator(container: container, router: router)
        return coordinator
    }
}
