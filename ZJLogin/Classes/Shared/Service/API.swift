//
//  API.swift
//  Pods-ZJLogin_Example
//
//  Created by Jercan on 2023/9/12.
//

import ZJCommonDefines
import ZJRequest
import Moya

enum API {

    // MARK: -  ------ 注册 --------
    
    /// 注册页面文案
    case registerTips
    
    // MARK: -  ------ 登录 --------
    
    
}

extension API: ZJRequestTargetType {
    
    var baseURL: URL { URL(string: ZJUrl.server)! }
    
    var headers: [String : String]? { nil }
    
    var path: String {
        switch self {
        case .registerTips:
            return "/api/app/user/register/tips"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .registerTips:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .registerTips:
            return .requestPlain
        }
    }
    
    var sampleData: Data { ".".data(using: .utf8)! }
    
    
    
}
