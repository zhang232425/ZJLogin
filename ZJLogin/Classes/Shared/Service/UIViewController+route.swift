//
//  UIViewController+route.swift
//  ZJLogin
//
//  Created by Jercan on 2023/9/20.
//

import ZJBase
import ZJCommonDefines

struct Route<Base> {
    let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

protocol Routable {
    associatedtype RouteBase
    var route: Route<RouteBase> { get }
}

extension Routable {
    var route: Route<Self> { Route(self) }
}
