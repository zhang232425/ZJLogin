//
//  RegisterViewController.swift
//  Pods-ZJLogin_Example
//
//  Created by Jercan on 2023/9/12.
//

import UIKit

class RegisterViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

}

private extension RegisterViewController {
    
    func setupViews() {
        
        let label = UILabel().then {
            $0.text = "我是注册页面"
        }
        
        label.add(to: view).snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
    }
    
}
