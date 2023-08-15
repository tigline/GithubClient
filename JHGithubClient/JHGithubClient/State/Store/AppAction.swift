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
}

protocol AppCommand {
    func execute(in store: Store)
}
