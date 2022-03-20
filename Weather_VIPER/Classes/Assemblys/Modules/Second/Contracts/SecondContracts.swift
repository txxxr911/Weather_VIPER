//
//  SecondContracts.swift
//  Weather_VIPER
//
//  Created by Victor on 17.03.2022
//  
//

import Foundation

// Module Input
protocol SecondModuleInput {
    
}

// Module Output
protocol SecondModuleOutput {
    
}

// View Input
protocol SecondViewInput: class {
    func set(title: String)
}

// View Output
protocol SecondViewOutput: class {
    func viewDidLoad()
}

// Interactor
protocol SecondInteractorInput {
}

// Router
protocol SecondRouterProtocol: AlertRoutable {
    
}
