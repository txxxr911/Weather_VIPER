//
//  LocationServiceType.swift
//  Weather_VIPER
//
//  Created by Victor on 06.03.2022
//	
//

import Foundation

protocol LocationServiceType {
    func getCoordinate(didGetCoordinate : @escaping (Coordinate) -> Void)
	
}
