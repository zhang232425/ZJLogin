//
//  BaseViewController.swift
//  Pods-ZJLogin_Example
//
//  Created by Jercan on 2023/9/12.
//

import UIKit
import Then
import Action
import RxSwift
import RxSwiftExt
import RxCocoa
import ZJExtension
import ZJBase
import SnapKit
import ZJHUD

class BaseViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    private var hud: ZJHUDView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    deinit {
        hud?.hide()
    }

}

private extension BaseViewController {
    
    func config() {
        view.backgroundColor = .white
    }
    
}

extension BaseViewController {
    
    func onError(_ error: Error) {
        
        if let err = error as? ActionError {
            switch err {
            case .notEnabled:
                break
            case .underlyingError(let e):
                ZJHUD.noticeOnlyText(e.localizedDescription)
            }
        } else {
            ZJHUD.noticeOnlyText(error.localizedDescription)
        }
        
    }
    
    func onProgress(_ executing: Bool) {
        
        if executing {
            view.endEditing(true)
            hud?.hide()
            hud = ZJHUDView()
            hud?.showProgress()
        } else {
            hud?.hide()
        }
        
    }
    
}

