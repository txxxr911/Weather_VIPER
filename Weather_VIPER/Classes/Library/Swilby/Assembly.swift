//
//  Assembly.swift
//  Weather_VIPER
//
//  Created by Victor on 05.03.2022
//  
//

import Foundation

protocol AssemblyType: class {
    associatedtype Container
    var container: Container {get set}
    init(container: Container)
}

class Assembly: AssemblyType {
    //typealias Container = Resolver
    
    var container: Container
    
    required init(container: Container) {
        self.container = container
    }
}

// Box
extension Assembly {
    func weakBox<T>(_ configure: () -> T) -> T {
        return self.container.weakBox(configure)
    }
    
    func strongBox<T>(_ configure: () -> T) -> T {
        return self.container.strongBox(configure)
    }
}
