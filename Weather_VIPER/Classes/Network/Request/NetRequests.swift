//
//  NetRequests.swift
//  Weather_VIPER
//
//  Created by Victor on 05.03.2022
//  
//

import Foundation

protocol RequstModelSerealizable {
    func parameters() -> [String: Any]
    func body() -> Data
}

extension RequstModelSerealizable {
    func parameters() -> [String: Any] { return [:] }
    func body() -> Data { return Data() }
}
