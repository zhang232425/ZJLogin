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
    
    /// 设置字符密码
    case setStringPassword(password: String, accessToken: String)
    
    // MARK: - ------- 获取验证码 -------
    /// 获取验证码-登录
    case getCaptcha_login(account: String, imageCaptcha: String?)
    /// 获取验证码-注册
    case getCaptcha_register(account: String, imageCaptcha: String?)
    /// 获取验证码-忘记密码
    case getCaptcha_forgotPwd(account: String, imageCaptcha: String?)
    /// 输入邀请码
    case inputReferralCode(code: String)
    
    
}

extension API: ZJRequestTargetType {
    
    var baseURL: URL { URL(string: ZJUrl.server)! }
    
    var headers: [String : String]? {
        switch self {
        case .setStringPassword(_, let accessToken):
            return ["Authorization": accessToken]
        default:
            return nil
        }
    }
    
    /**
     switch self {
     case .setStringPassword(_, let token):
         return ["Authorization": token]
     default:
         return nil
     }
     */
    
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
            
        case .setStringPassword:
            return "/api/app/user/setLoginPassword"
        case .inputReferralCode:
            return "/api/app/user/setReferrer"
        
            
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
            
        case .setStringPassword:
            return .post
        case .inputReferralCode:
            return .post
            
        }
    }
    
    var task: Moya.Task {
        switch self {
            
        case .registerTips:
            return .requestPlain
            
        case .register(let account, let captcha, let deviceToken, let analyticsId):
            var params: [String: Any] = ["phoneNumber": account,
                                        "captcha": captcha,
                                        "channel": "ios"]
            params["deviceToken"] = deviceToken
            params["adId"] = analyticsId
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        case .getCaptcha_login(let account, let captcha):
            var params: [String: Any] = ["phoneNumber": account, "smsBizType": 2]
            params["imageCaptcha"] = captcha
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        case .getCaptcha_register(let account, let captcha):
            var params: [String: Any] = ["phoneNumber": account, "smsBizType": 1]
            params["imageCaptcha"] = captcha
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        case .getCaptcha_forgotPwd(let account, let captcha):
            var params: [String: Any] = ["phoneNumber": account]
            params["imageCaptcha"] = captcha
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        case .setStringPassword(let password, _):
            let params: [String: Any] = ["password": password]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        case .inputReferralCode(let code):
            let params: [String: Any] = ["referrerCode": code]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        }
    }
    
    var sampleData: Data { ".".data(using: .utf8)! }
    
    
    
}

