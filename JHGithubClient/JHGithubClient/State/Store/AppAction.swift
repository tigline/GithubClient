//
//  AppAction.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/15.
//

import Foundation
enum AppAction {
    // Settings

    case login(token:String)
    case logout
    case loadUserlist
    case loadUserDetail(userId:String)
    case loadUserDetailDone(result: Result<UserDetailViewModel, AppError>)
    case loadUserlistDone(result: Result<[GitHubUser], AppError>)
}


