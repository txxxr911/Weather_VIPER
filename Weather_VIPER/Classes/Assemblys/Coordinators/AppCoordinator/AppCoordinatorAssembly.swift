//
//  AppCoordinatorAssembly.swift
//  Weather_VIPER
//
//  Created by Victor on 05.03.2022
//  
//

import UIKit

class AppCoordinatorAssembly: Assembly {
    func build() -> AppCoordinatorType {
        let navigationController = UINavigationController(rootViewController: UIViewController())
        let router = Router(navigationController: navigationController)
        let coordinator = AppCoordinator(container: container, router: router)
        return coordinator
    }
}
