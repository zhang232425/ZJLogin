//
//  CodeLoginController.swift
//  ZJLogin
//
//  Created by Jercan on 2023/9/25.
//

import UIKit

class CodeLoginController: BaseViewController {
    
    // MARK: - Property
    var inputPhone: String {
        get {
            containerView.inputPhone
        }
        set {
            containerView.inputPhone = newValue
        }
    }
    
    private let viewModel: LoginViewModel
    
    // MARK: - Lazy load
    private lazy var containerView = CodeLoginContainerView()

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindViewModel()
    }

}

private extension CodeLoginController {
    
    func setupViews() {
        
        containerView.add(to: view).snp.makeConstraints {
            $0.width.edges.equalToSuperview()
        }
        
    }
    
    func bindViewModel() {
        
        containerView.passwordLoginTap.subscribe(onNext: { [weak self] in
            (self?.parent as? LoginContainerController)?.transition(to: .password)
        }).disposed(by: disposeBag)
        
    }
    
}
