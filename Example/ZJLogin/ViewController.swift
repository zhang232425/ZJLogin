//
//  ViewController.swift
//  ZJLogin
//
//  Created by zhang232425 on 09/04/2023.
//  Copyright (c) 2023 zhang232425. All rights reserved.
//

import UIKit
import ZJRoutableTargets
import ZJBase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login() {
        
        if let vc = ZJLoginRoutableTarget.login.viewController {
            present(ZJNavigationController(rootViewController: vc), animated: true)
        }
        
    }
    
    @IBAction func register() {
        
        if let vc = ZJLoginRoutableTarget.register(success: {
            print("注册成功了")
        }).viewController {
            present(ZJNavigationController(rootViewController: vc), animated: true)
        }
        
    }
    
    @IBAction func gesture() {
        
        print("手势管理")
        
    }
    
}

