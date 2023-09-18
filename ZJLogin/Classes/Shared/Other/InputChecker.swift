//
//  InputChecker.swift
//  ZJLogin
//
//  Created by Jercan on 2023/9/18.
//

import Foundation

protocol InputChecker {}

extension InputChecker {
    
    func checkAccountInputError(_ string: String) -> Swift.Error? {
        
        if string.isEmpty {
            return AccountInputError.empty
        }
        
        if !(10...13).contains(string.count) {
            return AccountInputError.countError
        }
        
        if !string.hasPrefix(Locale.phonePrefix) {
            return AccountInputError.prefixError
        }
        
        return nil
        
    }
    

}

private enum AccountInputError: LocalizedError {
    
    case empty
    case countError
    case prefixError
    
    var errorDescription: String? {
        switch self {
        case .empty:
            return Locale.enterPhoneNumer.localized
        case .countError:
            return Locale.phoneCountError.localized
        case .prefixError:
            return Locale.phonePrefixError.localized
        }
    }
    
}

