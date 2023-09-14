//
//  RegisterContainerView.swift
//  Action
//
//  Created by Jercan on 2023/9/12.
//

import UIKit

class RegisterContainerView: UIScrollView {
    
    private lazy var containerView = UIView()
    
    private lazy var titleView = PageCommonTitleView(title: Locale.register.localized, subTitle: .init())

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension RegisterContainerView {
    
    func setupViews() {
        
        containerView.add(to: self).snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleView.add(to: containerView).snp.makeConstraints {
            $0.top.equalToSuperview().inset(40.auto)
            $0.left.right.equalToSuperview().inset(20.auto)
        }
        
        
    }
    
}

extension RegisterContainerView {
    
    func setSubTitle(_ subTitle: NSAttributedString) {
        titleView.setSubTitle(subTitle)
    }
    
}

