//
//  CoordinatorType.swift
//  Weather_VIPER
//
//  Created by Victor on 05.03.2022
//  
//

import Foundation

protocol CoordinatorType: AnyObject, Presentable {
    var container: Container {get}
    var router: RouterType {get}
    var completion: (() -> Void)? {get set}
    
    func start()
    func start(with option: DeepLinkOption?)
}
