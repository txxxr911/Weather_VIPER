//
//  Presentable.swift
//  Weather_VIPER
//
//  Created by Victor on 05.03.2022
//  
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController
}

extension UIViewController: Presentable {
    func toPresent() -> UIViewController {
        return self
    }
}
