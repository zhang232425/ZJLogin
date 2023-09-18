//
//  Request+account.swift
//  ZJLogin
//
//  Created by Jercan on 2023/9/18.
//

import RxSwift
import HandyJSON
import ZJRequest

extension Request {
    enum account {}
}

extension Request.account {
    
    static func registerTips() -> Single<RegisterTipsModel?> {
        API.registerTips.rx.request()
            .mapObject(ZJRequestResult<RegisterTipsModel>.self)
            .map { $0.data }
    }
    
}
