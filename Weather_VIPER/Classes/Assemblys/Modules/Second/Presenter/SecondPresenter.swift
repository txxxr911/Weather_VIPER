//
//  SecondPresenter.swift
//  Weather_VIPER
//
//  Created by Victor on 17.03.2022
//  
//

import Foundation

class SecondPresenter: BasePresenter<SecondInteractorInput, SecondRouterProtocol>, SecondModuleOutput {
    
    // MARK: - Weak properties
    weak var view: SecondViewInput?
}

// MARK: Private
extension SecondPresenter {
    
}

// MARK: Module Input
extension SecondPresenter: SecondModuleInput {
    
}

// MARK: View Output
extension SecondPresenter: SecondViewOutput {
    func viewDidLoad() {
        view?.set(title: "Second")
    }
}
