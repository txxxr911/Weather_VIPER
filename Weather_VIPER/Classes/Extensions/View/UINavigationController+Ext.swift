//
//  UINavigationController+Ext.swift
//  Weather_VIPER
//
//  Created by Victor on 05.03.2022
//  
//

import UIKit

public extension UINavigationController {
    var rootViewController: UIViewController {
        return self.viewControllers.first!
    }
    
    func setTransparentNavigationBar() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }
}
