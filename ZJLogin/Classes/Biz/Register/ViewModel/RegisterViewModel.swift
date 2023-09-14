//
//  RegisterViewModel.swift
//  ZJLogin
//
//  Created by Jercan on 2023/9/13.
//

import Action
import RxSwift
import ZJExtension

final class RegisterViewModel {
    
    /*
    private(set) var registerTipsAction: Action<Void, NSAttributedString>!
    
    init() {
        
        registerTipsAction = .init(workFactory: { _ in
            Request.registerTips().map { (full, bold) -> NSAttributedString in
                
                guard !full.isEmpty else { return .init() }
                
                let attrStr = NSMutableAttributedString(string: full)
                let fullRange = NSMakeRange(0, full.count)
                attrStr.addAttribute(.foregroundColor, value: UIColor(hexString: "#666666"), range: fullRange)
                attrStr.addAttribute(.font, value: UIFont.regular16, range: fullRange)
                
                let boldRange = attrStr.mutableString.range(of: bold)
                if boldRange.location != NSNotFound {
                    attrStr.addAttribute(.font, value: UIFont.bold16, range: boldRange)
                }
                return attrStr
                
            }
        })
        
    }
     */
    
    private(set) var registerTipsAction: Action<Void, NSAttributedString>!
    
    init() {
        
        registerTipsAction = .init(workFactory: { _ in
            
            Request.registerTips().map { model -> NSAttributedString in
                
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
        
    }
    
}

/**
 
 */
