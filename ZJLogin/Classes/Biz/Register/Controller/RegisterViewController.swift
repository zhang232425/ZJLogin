//
//  RegisterViewController.swift
//  Pods-ZJLogin_Example
//
//  Created by Jercan on 2023/9/12.
//

import UIKit
import ZJHUD

class RegisterViewController: BaseViewController {
    
    private var captchaSuccess: ((String?) -> Void)?
    
    let viewModel = RegisterViewModel()
    
    // MARK: - Lazy load
    private lazy var containerView = RegisterContainerView()
    
    private lazy var ojkLoginView = OJKLogoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindViewModel()
        viewModel.registerTipsAction.execute()
    }

}

private extension RegisterViewController {
    
    func setupViews() {
        
        if navigationController?.viewControllers.first == self {
            navigationItem.leftBarButtonItem = .custom(image: UIImage.dd.named("nav_close"), action: {
                self.navigationController?.dismiss(animated: true)
            })
        }
        
        navigationItem.rightBarButtonItem = .custom(title: Locale.login.localized, action: {
            print("我要登录")
        })
            
        containerView.add(to: view).snp.makeConstraints {
            $0.edges.equalToSafeArea(of: view)
        }
        
        ojkLoginView.add(to: view).snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSafeArea(of: view).inset(20.auto)
        }
        
    }
    
    func bindViewModel() {
        
        containerView.agreementChecked
        
        viewModel.registerTipsAction.elements
            .subscribeNext(weak: containerView, RegisterContainerView.setSubTitle)
            .disposed(by: disposeBag)
        
        viewModel.registerCaptcha.errors
            .subscribeNext(weak: self, type(of: self).onError)
            .disposed(by: disposeBag)
        
        viewModel.registerCaptcha.executing
            .subscribeNext(weak: self, type(of: self).onProgress)
            .disposed(by: disposeBag)
        
        viewModel.registerCaptcha.elements
            .subscribeNext(weak: self, type(of: self).captchaResult)
            .disposed(by: disposeBag)
    
    }
    
    func captchaResult(_ result: Request.getCaptcha.Result) {
        
        switch result {
        case .success(let code):
            captchaSuccess?(code)
        case .needImageCaptcha:
            print("需要图片验证码")
        case .imageCapthaError(let msg):
            ZJHUD.noticeOnlyText(msg)
        case .bizError(let msg):
            ZJHUD.noticeOnlyText(msg)
        }
        
    }
    
}

extension RegisterViewController: GetCaptchaRequester {
    
    func performGetCaptchaRequest(onSuccess: @escaping (String?) -> Void) {
        
        captchaSuccess = onSuccess
        
        let account = containerView.phoneNumber
        viewModel.registerCaptcha.execute((account: account, imageCaptcha: nil))
        
    }
    
}
