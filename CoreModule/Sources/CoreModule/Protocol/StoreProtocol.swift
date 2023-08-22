//
//  File.swift
//  
//
//  Created by Aaron on 2023/8/19.
//

import Foundation
import SwiftUI

// State
public protocol IAppState { }

// Action
public protocol IAppAction { }

// Reducer协议，每个模块的reducer都应实现此协议
public protocol AppStore {
    associatedtype State: IAppState
    associatedtype Action: IAppAction
    //associatedtype Command: AppCommand
    //static func reduce<T: IAppState>(state: inout T, action: IAppAction)-> (IAppState, AppCommand?)
    func dispatch(_ action: Action)
    static func reduce(state: inout State, action: Action)-> (State, AppCommand?)
    
}


public protocol Mediator {
    func send(_ action: IAppAction, sender: Any?)
}


public protocol AnyNavigator {
    func view(for route: Any) -> AnyView?
}

protocol Navigator: AnyNavigator {
    associatedtype RouteType
    func view(for route: RouteType) -> AnyView
}

extension Navigator {
    func view(for route: Any) -> AnyView? {
        guard let typedRoute = route as? RouteType else { return nil }
        return AnyView(self.view(for: typedRoute))
    }
}



