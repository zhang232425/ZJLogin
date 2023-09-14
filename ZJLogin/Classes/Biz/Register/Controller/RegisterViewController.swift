//
//  RegisterViewController.swift
//  Pods-ZJLogin_Example
//
//  Created by Jercan on 2023/9/12.
//

import UIKit

class RegisterViewController: BaseViewController {
    
    let viewModel = RegisterViewModel()
    
    // MARK: - Lazy load
    private lazy var containerView = RegisterContainerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindViewModel()
        viewModel.registerTipsAction.execute()
    }

}

private extension RegisterViewController {
    
    func setupViews() {
        
        containerView.add(to: view).snp.makeConstraints {
            $0.edges.equalToSafeArea(of: view)
        }
        
    }
    
    func bindViewModel() {
        
        viewModel.registerTipsAction.elements
            .subscribeNext(weak: containerView, RegisterContainerView.setSubTitle)
            .disposed(by: disposeBag)
        
    }
    
}

/**
 viewModel.registerTipsAction.elements
     .subscribeNext(weak: containerView, RegisterContainerView.setSubTitle)
     .disposed(by: disposeBag)
 */
