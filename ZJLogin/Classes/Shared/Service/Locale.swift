//
//  Locale.swift
//  Pods-ZJLogin_Example
//
//  Created by Jercan on 2023/9/12.
//

import ZJLocalizable

enum Locale: String {
    
    case register
    
}

extension Locale: ZJLocalizable {
    
    var key: String {
        return rawValue
    }
    
    var table: String {
        return "Locale"
    }
    
    var bundle: Bundle {
        return .framework_ZJLogin
    }
    
}
