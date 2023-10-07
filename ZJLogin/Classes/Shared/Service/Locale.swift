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
    case loginNow
    case accountAlreadyExists
    
    case passwordPlaceholder
    case confirm
    
    case setLoginPassword
    case usePasswordLoginLater
    case skip
    case enterPassword
    case passwordFormatError
    case setPasswordSuccessfully
    case correctPasswordHint
    case correctPasswordToast
    case passwordTlaceholder
    
    //MARK: - 输入邀请码
    case referralCode
    case referralCodeDescription
    case submit
    case referralEmpty
    case success
    
    //MARK: - 密码登录
    case loginWithPassword
    case welcomeToAsetku
    case enterLoginPwd
    case forgotPassword
    case loginWithCode
    case accountNotExistOrPasswordWrong
    case loginSuccessful
    case ok
    case accountFrozenNotice
    case accountFrozenPhonePrefix
    case iKnow
    case phoneCopied
    case frozenTitle
        
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

