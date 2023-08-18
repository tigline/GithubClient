//
//  AppState.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/15.
//

import Foundation
import Combine

struct AppState {
    var login = Login()
    var settings = Settings()
    var rootTab = RootTab()
    var viewRouter: ViewRouter = .init(currentPage: .login)
    var userList = UserList()
}

struct ViewRouter {
    var currentPage: Page
}

enum Page {
    case login
    case main
}

extension AppState {
    struct UserList {
        var users:[GitHubUserViewModel]?
        var detailedUsers:[Int:UserDetailViewModel] = [:]
        var userListLoadingError: AppError?
        var isLoading = false
        var searchText = ""
        
        func displayUsers()->[GitHubUserViewModel] {
            guard !searchText.isEmpty else {
                return users ?? []
            }
            return users?.filter{$0.login.contains(searchText.lowercased())} ?? []
        }
        
        var detailUserId:Int?
        
    }
    

}

extension AppState {
    struct Settings {
        var token: String = ""
    }
}


extension AppState {
    struct Login {
        enum loginState: CaseIterable {
            case loginOut, login
        }
        
        var isLogin:Bool = false
    }
}

extension AppState {
    struct RootTab {
        enum Index: Hashable {
            case list, settings
        }

        var selection: Index = .list
    }
}
