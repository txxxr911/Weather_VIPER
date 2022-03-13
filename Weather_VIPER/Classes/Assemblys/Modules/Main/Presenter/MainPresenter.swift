//
//  MainPresenter.swift
//  Weather_VIPER
//
//  Created by Victor on 05.03.2022
//  
//

import Foundation

class MainPresenter: BasePresenter<MainInteractorInput, MainRouterProtocol>, MainModuleOutput {
    // MARK: - Weak properties
    weak var view: MainViewInput?
}

// MARK: Private
extension MainPresenter {
    
}

// MARK: Module Input
extension MainPresenter: MainModuleInput {
    
}

// MARK: View Output
extension MainPresenter: MainViewOutput {
//    var currentCoordinate: Coordinate {
//        interactor.currentCoordinate
//    }
    
//    var currentWeather: DecodeWeatherData {
//        interactor.currentWeather
//    }
    
    func viewDidLoad(updateUI: @escaping (DecodeWeatherData) -> Void) {
        print ("presenter get request and send to interactor")
        interactor.viewDidLoad { b in
            updateUI(b)
            print ("presenter send responce")
        } saveData: {
            
        }

        }
    }


