//
//  AppDelegate.swift
//  Weather_VIPER
//
//  Created by Victor on 05.03.2022
//  
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: AppDelegateManager {
    var window: UIWindow?
    
    lazy var container: DependencyContainer = {
        let factory = AssemblyFactory()
        let container = DependencyContainer(assemblyFactory: factory)
        
        // Setup Coordinators
        container.apply(AppCoordinatorAssembly.self)
        container.apply(MainCoordinatorAssembly.self)
        container.apply(SecondCoordinatorAssembly.self)
        
        // Setup Modules
        container.apply(MainAssembly.self)
        container.apply(SecondAssembly.self)
        
        // Setup Services
        container.apply(AppConfigServiceAssembly.self)
        container.apply(EnvironmentServiceAssembly.self)
        container.apply(LocationServiceAssembly.self)
        container.apply(WeatherDataServiceAssembly.self)
        container.apply(StorageServiceAssembly.self)
        
        // Setup Manager
        container.apply(ManagerAssembly.self)
        
        return container
    }()
    
    override var services: [AppDelegateService] {
        return [
            ApplicationService(container: container, window: window)
        ]
    }
}

