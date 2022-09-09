//
//  AppCoordinator.swift
//  Weather_VIPER
//
//  Created by Victor on 05.03.2022
//  
//

import Foundation

class AppCoordinator: BaseCoordinator, AppCoordinatorType {
    
    private var instructor: LaunchInstructor {
        return LaunchInstructor.configure(tutorialWasShown: true, isAutorized: true)
    }
    
    override func start(with option: DeepLinkOption?) {
        if let option = option {
            switch option {
            case .home:
                startMainFlow()
            }
        } else {
            switch instructor {
            case .auth: startAuthFlow()
            case .onboarding: startOnboardingFlow()
            case .main: startMainFlow()
            }
        }
    }
}

// MARK: Main Flow
extension AppCoordinator {
    func startMainFlow() {
        let coordinator = container.resolve(MainCoordinatorAssembly.self).build(router: router)
        addChild(coordinator)
        coordinator.start()
        
        self.router.setRootModule(coordinator)
    }
}

// MARK: Auth Flow
extension AppCoordinator {
    func startAuthFlow() {
        
    }
}

// MARK: Onboarding Flow
extension AppCoordinator {
    func startOnboardingFlow() {
        
    }
}

// MARK: WeekWeather Flow
extension AppCoordinator {
    func startWeekWeatherFlow() {
        let coordinator = container.resolve(SecondCoordinatorAssembly.self).build()
        addChild(coordinator)
        coordinator.start()
        self.router.present(coordinator)
    }
}
