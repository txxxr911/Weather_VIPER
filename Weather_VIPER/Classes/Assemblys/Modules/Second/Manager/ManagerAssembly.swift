//
//  ManagerAssembly.swift
//  Weather_VIPER
//
//  Created by Victor on 23.03.2022
//	
//

import Foundation

class ManagerAssembly: Assembly {
    func build() -> ManagerType {
        let service = Manager()
        return service
    }
}
