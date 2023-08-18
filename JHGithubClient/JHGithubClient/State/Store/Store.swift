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
        case .loadUserlist:
            if appState.userList.isLoading {
                break
            }
            appState.userList.userListLoadingError = nil
            appState.userList.isLoading = true
            appCommand = LoadGithubUserListCommand()
        case .loadUserDetail(userId: let name):
            appState.userList.isLoading = true
            appCommand = LoadGithubUserDetailCommand(name: name)
            break
            
        case .loadUserDetailDone(result: let result):
            appState.userList.isLoading = false
            switch result {
            case .success(let model):
                //appState.userList.users = models.map{GitHubUserViewModel(user: $0)}
                appState.userList.detailedUsers.updateValue(model, forKey: model.id)
                print("loading userDetail success")
            case .failure(let error):
                appState.userList.userListLoadingError = error
            }
            
        case .loadUserlistDone(result: let result):
            appState.userList.isLoading = false
            switch result {
            case .success(let models):
                appState.userList.users = models.map{GitHubUserViewModel(user: $0)}
                print("loading userList success")
            case .failure(let error):
                appState.userList.userListLoadingError = error
            }
        }
        
        return (appState, appCommand)
        
    }
    
}

