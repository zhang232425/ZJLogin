//
//  Request.swift
//  ZJLogin
//
//  Created by Jercan on 2023/9/13.
//

import RxSwift
import ZJRequest

struct Request {
    
    /*
    static func registerTips() -> Single<(String, String)> {
        
        API.registerTips.rx.request()
            .mapObject(ZJRequestResult<[String: Any]>.self)
            .map {
                if let fullText = $0.data?["fullText"] as? String, let boldText = $0.data?["boldText"] as? String {
                    return (fullText, boldText)
                }
                return ("", "")
            }
    }
     */
    
    
    static func registerTips() -> Single<RegisterTipsModel?> {
        
        API.registerTips.rx.request()
            .mapObject(ZJRequestResult<RegisterTipsModel>.self)
            .map { $0.data }
        
    }
    
    
    
    
    
    
}

/**
 
 */

/**
 static func fetchLaunchAdInfo() -> Single<LaunchAdInfo?> {
     API.launchAd.rx.request()
         .mapObject(ZJRequestResult<LaunchAdResult>.self)
         .map { $0.data?.infos?.first}
 }
 */
