//
//  StorageServiceAssembly.swift
//  Weather_VIPER
//
//  Created by Victor on 07.03.2022
//	
//

import Foundation

class StorageServiceAssembly: Assembly {
    func build() -> StorageServiceType {
        let service = StorageService()
        return service
    }
}
