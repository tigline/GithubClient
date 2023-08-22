//
//  File.swift
//  
//
//  Created by Aaron on 2023/8/19.
//

import CoreModule
import Combine
import Foundation

struct LoginState: IAppState {
    var login = Login()
}

extension LoginState {
    struct Login {
        enum loginState: CaseIterable {
            case loginOut, login
        }
        //var userLoginError: AppError?
        var isLoading:Bool = false
        var userId: String = ""
        var token: String = ""
        var loginState:loginState = .loginOut
        //var user:User?

    }
}

enum LoginAction: IAppAction {
    case login
    case logout
}



struct LoginCommand: AppCommand {
    func execute<T>(in store: T) where T : AppStore{}
}




class LoginStore: ObservableObject, AppStore {

    @Published var loginState = LoginState()
    private var disposeBag = Set<AnyCancellable>()
    
    func dispatch(_ action: LoginAction) {
        print("[ACTION]: \(action)")
        let result = LoginStore.reduce(state: &loginState, action: action)
        loginState = result.0
        if let command = result.1 {
            print("[COMMAND]: \(command)")
            command.execute(in: self)
        }
    }
    
    static func reduce(state: inout LoginState, action: LoginAction) -> (LoginState, AppCommand?) {
        var loginState = state
        var appCommand: AppCommand? = nil
        
        switch action {

        case .login:
            break
        case .logout:
            break
        }
        
        return (loginState, appCommand)
    }

}
