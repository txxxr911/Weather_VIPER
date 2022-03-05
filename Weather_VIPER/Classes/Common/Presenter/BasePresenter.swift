//
//  BasePresenter.swift
//  Weather_VIPER
//
//  Created by Victor on 05.03.2022
//  
//

import Foundation

class BasePresenter<I, R> {
    let interactor: I
    let router: R
    
    init(interactor: I, router: R) {
        self.interactor = interactor
        self.router = router
    }
}
