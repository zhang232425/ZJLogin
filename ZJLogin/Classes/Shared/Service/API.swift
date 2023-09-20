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
    /// 注册
    case register(account: String, captcha: String, deviceToken:String?, analyticsId: String?)
    
    // MARK: -  ------ 登录 --------
    
    // MARK: - ------- 获取验证码 -------
    /// 获取验证码-登录
    case getCaptcha_login(account: String, imageCaptcha: String?)
    /// 获取验证码-注册
    case getCaptcha_register(account: String, imageCaptcha: String?)
    /// 获取验证码-忘记密码
    case getCaptcha_forgotPwd(account: String, imageCaptcha: String?)
    
    
}

extension API: ZJRequestTargetType {
    
    var baseURL: URL { URL(string: ZJUrl.server)! }
    
    var headers: [String : String]? { nil }
    
    var path: String {
        switch self {
        case .registerTips:
            return "/api/app/user/register/tips"
        case .register:
            return "/api/app/user/register"
        case .getCaptcha_register:
            return "/api/app/user/sms/captcha"
        case .getCaptcha_login:
            return "/api/app/user/sms/captcha"
        case .getCaptcha_forgotPwd:
            return "/api/app/user/getCaptchaNoToken"
            
            
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .registerTips:
            return .get
        case .register:
            return .post
        case .getCaptcha_login:
            return .get
        case .getCaptcha_register:
            return .get
        case .getCaptcha_forgotPwd:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
            
        case .registerTips:
            return .requestPlain
            
        case .register(let account, let captcha, let deviceToken, let analyticsId):
            var param: [String: Any] = ["phoneNumber": account,
                                        "captcha": captcha,
                                        "channel": "ios"]
            param["deviceToken"] = deviceToken
            param["adId"] = analyticsId
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
            
        case .getCaptcha_login(let account, let captcha):
            var param: [String: Any] = ["phoneNumber": account, "smsBizType": 2]
            param["imageCaptcha"] = captcha
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
            
        case .getCaptcha_register(let account, let captcha):
            var param: [String: Any] = ["phoneNumber": account, "smsBizType": 1]
            param["imageCaptcha"] = captcha
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
            
        case .getCaptcha_forgotPwd(let account, let captcha):
            var param: [String: Any] = ["phoneNumber": account]
            param["imageCaptcha"] = captcha
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
            
        }
    }
    
    var sampleData: Data { ".".data(using: .utf8)! }
    
    
    
}
