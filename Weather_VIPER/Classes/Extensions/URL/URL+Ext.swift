//
//  URL+Ext.swift
//  Weather_VIPER
//
//  Created by Victor on 05.03.2022
//  
//

import Foundation

extension URL {
    func fileSize() -> Int64 {
        if let resourceValuess = try? (self as NSURL).resourceValues(forKeys: [URLResourceKey.fileSizeKey]) {
            let size = resourceValuess[URLResourceKey.fileSizeKey]
            return size as? Int64 ?? 0
        } else {
            return 0
        }
    }
}
