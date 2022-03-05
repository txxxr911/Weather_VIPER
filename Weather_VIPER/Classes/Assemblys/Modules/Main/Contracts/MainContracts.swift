//
//  MainContracts.swift
//  Weather_VIPER
//
//  Created by Victor on 05.03.2022
//  
//

import UIKit

// Module Input
protocol MainModuleInput {
    
}

// Module Output
protocol MainModuleOutput: ModuleOutput {
    
}

// View Input
protocol MainViewInput: AnyObject {
    func set(title: String)
}

// View Output
protocol MainViewOutput: AnyObject {
    func viewDidLoad()
}

// Interactor
protocol MainInteractorInput {

}

// Router
protocol MainRouterProtocol: AlertRoutable {

}
