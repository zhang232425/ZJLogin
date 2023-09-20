//
//  Locale.swift
//  Pods-ZJLogin_Example
//
//  Created by Jercan on 2023/9/12.
//

import ZJLocalizable

enum Locale: String {
    
    case register
    case enterPhoneNumer
    case enterVerficationCode
    case send
    case resend
    case next
    case tncLendingBorrowing
    case privacyPolicy
    case agreementDescription
    case login
    case phoneCountError
    case phonePrefixError
    case makeSureApprovedTerms
    case enterReferralCode
    
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

extension Locale {
    
    func localized(arguments: [String]) -> String {
        String(format: localized, arguments: arguments)
    }
    
}

extension Locale {
    
    static let phonePrefix = "08"
    
}

