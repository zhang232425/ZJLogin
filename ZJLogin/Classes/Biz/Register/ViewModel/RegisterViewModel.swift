//
//  RegisterViewModel.swift
//  ZJLogin
//
//  Created by Jercan on 2023/9/13.
//

import Action
import RxSwift
import ZJExtension

final class RegisterViewModel: InputChecker {
    
    private(set) var registerTipsAction: Action<Void, NSAttributedString>!
    
    private(set) var registerCaptcha: Action<(account: String,
                                              imageCaptcha: String?), Request.getCaptcha.Result>!
    
    init() {
        
        registerTipsAction = .init(workFactory: { _ in
            
            Request.account.registerTips().map { model -> NSAttributedString in
                
                guard let tips = model else { return .init() }
                
                let attrStr = NSMutableAttributedString(string: tips.full)
                let fullRange = NSMakeRange(0, tips.full.count)
                attrStr.addAttribute(.foregroundColor, value: UIColor(hexString: "#666666"), range: fullRange)
                attrStr.addAttribute(.font, value: UIFont.regular16, range: fullRange)
                
                let boldRange = attrStr.mutableString.range(of: tips.bold)
                if boldRange.location != NSNotFound {
                    attrStr.addAttribute(.font, value: UIFont.bold16, range: boldRange)
                }
                
                return attrStr
                
            }
        })
        
        registerCaptcha = .init(workFactory: { [weak self] input -> Single<Request.getCaptcha.Result> in
            
            if let error = self?.checkAccountInputError(input.account) {
                return .error(error)
            }
            
            return Request.getCaptcha.onRegister(account: input.account, imageCaptcha: input.imageCaptcha)
            
        })
        
    }
    
}

