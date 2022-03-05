//
//  Int+Ext.swift
//  Weather_VIPER
//
//  Created by Victor on 05.03.2022
//  
//

import Foundation

extension Int {
    func declination(worlds: [String]) -> String {
        let cases = [2, 0, 1, 1, 1, 2]
        return worlds[(self % 100 > 4 && self % 100 < 20) ? 2 : cases[(self % 10 < 5) ? self % 10 : 5]]
    }
}

extension Int {
    func toString() -> String {
        return "\(self)"
    }
}
