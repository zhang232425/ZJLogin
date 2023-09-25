//
//  Request+password.swift
//  ZJLogin
//
//  Created by Jercan on 2023/9/25.
//

import RxSwift
import ZJRequest

extension Request {
    enum password {}
}

extension Request.password {
    
    static func setPassword(password: String, accessToken: String) -> Single<()> {
        
        API.setStringPassword(password: password, accessToken: accessToken).rx.request()
            .mapObject(ZJRequestResult<Any>.self)
            .flatMap {
                if !$0.success {
                    throw RequestError(msg: $0.mappedMsg)
                }
                return .just(())
            }
        
    }
    
}

