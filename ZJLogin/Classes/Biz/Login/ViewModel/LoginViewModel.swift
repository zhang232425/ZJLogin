//
//  LoginViewModel.swift
//  ZJLogin
//
//  Created by Jercan on 2023/9/25.
//

import RxSwift
import Action

final class LoginViewModel: InputChecker {
    
    private(set) var loginByPassword: Action<(account: String,
                                              password: String,
                                              captcha: String?), Request.login.Result>!
    
    init() {
        
        loginByPassword = .init(workFactory: { [weak self] input -> Single<Request.login.Result> in
            
            if let error = self?.checkAccountInputError(input.account) {
                return .error(error)
            }
            
            if input.password.isEmpty {
                return .error(InputError.passwordEmpty)
            }
            
            return Request.login.byPassword(account: input.account,
                                            password: input.password.md5(),
                                            captcha: input.captcha)
            
        })
        
    }
    
}

private enum InputError: LocalizedError {
    
    case passwordEmpty
    
    var errorDescription: String? {
        switch self {
        case .passwordEmpty:
            return Locale.enterLoginPwd.localized
        }
    }
    
}
