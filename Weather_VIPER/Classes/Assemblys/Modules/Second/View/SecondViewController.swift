//
//  SecondViewController.swift
//  Weather_VIPER
//
//  Created by Victor on 17.03.2022
//  
//

import UIKit

class SecondViewController: UIViewController, SecondViewInput {
    var output: SecondViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }
}

// MARK: - Configure
extension SecondViewController {
    
}

// MARK: View Input
extension SecondViewController {
    func set(title: String) {
        self.title = title
    }
}

// MARK: Button Action
extension SecondViewController {
    
}
