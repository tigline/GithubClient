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
        case .defaultLogin:
            appState.login.isLoading = true
            appState.login.token = "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"
            appCommand = LoadLoginUserCommand()
        case .login(user:_, token: let token):
            appState.login.isLoading = true
            appState.login.token = token
            appCommand = LoadLoginUserCommand()
        case .loginDone(result: let result):
            appState.login.isLoading = false
            switch result {
            case .success(let user):
                
                appState.login.user = user
                appState.viewRouter.currentPage = .main(viewModel:MeViewModel(user: user))
                print("loading User success")
            case .failure(let error):
                appState.login.userLoginError = error
                appState.showErrorAlert = true
                appState.errorMessage = error.localizedDescription
            }
            
        case .logout:
            appState.viewRouter.currentPage = .login
            appState.rootTab.selection = .list
            appState.login.token = ""
            appState.login.user = nil
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
                appState.showErrorAlert = true
                appState.errorMessage = error.localizedDescription
            }
            
        case .loadUserlistDone(result: let result):
            appState.userList.isLoading = false
            switch result {
            case .success(let models):
                appState.userList.users = models.map{GitHubUserViewModel(user: $0)}
                print("loading userList success")
            case .failure(let error):
                appState.userList.userListLoadingError = error
                appState.showErrorAlert = true
                appState.errorMessage = error.localizedDescription
            }

        case .dismissError:
            appState.showErrorAlert = false
            appState.errorMessage = ""
        }
        
        
        return (appState, appCommand)
        
    }
    
}

