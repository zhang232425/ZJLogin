//
//  PasswordViewModel.swift
//  ZJLogin
//
//  Created by Jercan on 2023/9/22.
//

import RxSwift
import Action
import CryptoSwift

final class PasswordViewModel {
    
    private(set) var initPasswordAction: Action<(password: String, accessToken: String), Void>!
    
    init() {
        
        initPasswordAction = .init(workFactory: { input -> Single<Void> in
            
            if input.password.isEmpty {
                return .error(InputError.passwordEmpty)
            }
            
            if !(8...16).contains(input.password.count) {
                return .error(InputError.passwordFormatError)
            }
            
            if !input.password.dd.isPassword() {
                return .error(InputError.passwordCorrentError)
            }
            
            return Request.password.setPassword(password: input.password.md5(), accessToken: input.accessToken)
            
        })
        
        
        
    }
    
}

private enum InputError: LocalizedError {
    
    case passwordEmpty
    case passwordFormatError
    case passwordCorrentError
    
    var errorDescription: String? {
        switch self {
        case .passwordEmpty:
            return Locale.enterPassword.localized
        case .passwordFormatError:
            return Locale.passwordFormatError.localized
        case .passwordCorrentError:
            return Locale.correctPasswordToast.localized
        }
    }
    
}

