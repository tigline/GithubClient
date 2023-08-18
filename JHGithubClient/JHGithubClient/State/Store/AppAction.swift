//
//  AppAction.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/15.
//

import Foundation
enum AppAction {
    // Settings

    case login(user:String,token:String)
    case defaultLogin
    case loginDone(result: Result<User, AppError>)
    case logout
    case loadUserlist
    case loadUserDetail(userId:String)
    case loadUserDetailDone(result: Result<UserDetailViewModel, AppError>)
    case loadUserlistDone(result: Result<[GitHubUser], AppError>)
    case dismissError
    
}


