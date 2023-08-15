//
//  Store.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/15.
//

import Combine

class Store: ObservableObject {
    @Published var appState = AppState()
    private var disposeBag = Set<AnyCancellable>()

    init() {
        setupObservers()
    }

    func setupObservers() {
//        appState.settings.checker.isValid.sink { isValid in
//            self.dispatch(.accountBehaviorButton(enabled: isValid))
//        }.store(in: &disposeBag)
//
//        appState.settings.checker.isEmailValid.sink { isValid in
//            self.dispatch(.emailValid(valid: isValid))
//        }.store(in: &disposeBag)
    }

    func dispatch(_ action: AppAction) {
        print("[ACTION]: \(action)")
        let result = Store.reduce(state: appState, action: action)
        appState = result.0
        if let command = result.1 {
            print("[COMMAND]: \(command)")
            command.execute(in: self)
        }
    }
    
    static func reduce(state: AppState, action: AppAction) -> (AppState, AppCommand?) {
        var appState = state
        var appCommand: AppCommand? = nil
        
        switch action {
            
        case .login(token: let token):
            appState.login.isLogin = true
            appState.settings.token = token
            appState.viewRouter.currentPage = .main
        case .logout:
            appState.login.isLogin = false
            appState.settings.token = ""
        }
        
        return (appState, appCommand)
        
    }
    
}

