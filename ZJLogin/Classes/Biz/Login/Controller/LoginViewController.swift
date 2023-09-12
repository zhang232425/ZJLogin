//
//  LoginViewController.swift
//  Pods-ZJLogin_Example
//
//  Created by Jercan on 2023/9/12.
//

import UIKit

class LoginViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindViewModel()
    }

}

private extension LoginViewController {
    
    func setupViews() {
        
        let label = UILabel().then {
            $0.text = "我是登录页面"
        }
        
        label.add(to: view).snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
    }
    
    func bindViewModel() {
        
        
    }
    
}
