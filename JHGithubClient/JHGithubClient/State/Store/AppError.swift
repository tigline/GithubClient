//
//  AppError.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/16.
//

import Foundation

enum AppError: Error, Identifiable {
    var id: String { localizedDescription }

    case requiresLogin
    case networkingFailed(Error)
}

extension AppError: LocalizedError {
    var localizedDescription: String {
        switch self {

        case .requiresLogin: return "Need Login"
        case .networkingFailed(let error): return error.localizedDescription

        }
    }
}
