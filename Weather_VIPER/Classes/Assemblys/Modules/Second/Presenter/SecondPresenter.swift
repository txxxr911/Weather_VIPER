//
//  SecondPresenter.swift
//  Weather_VIPER
//
//  Created by Victor on 17.03.2022
//  
//

import Foundation

class SecondPresenter: BasePresenter<SecondInteractorInput, SecondRouterProtocol>, SecondModuleOutput {
    var weekWeatherData: WeekWeatherData? = nil
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
    
    func showWeekWeather() {
        
    }
    
    
    func viewDidLoad(didGetData: @escaping () -> Void) {
        interactor.viewDidLoad {
            self.weekWeatherData = self.interactor.weekWeatherData
            didGetData()
        }
        }
        }
