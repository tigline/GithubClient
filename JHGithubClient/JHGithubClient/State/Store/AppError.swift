//
//  AppError.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/16.
//

import Foundation

enum AppError: Error, Identifiable {
    var id: String { localizedDescription }

    case networkingFailed(Error)
    case userNotFound(Error)
}

extension AppError: LocalizedError {
    var localizedDescription: String {
        switch self {

        case .networkingFailed(let error): return error.localizedDescription

        case .userNotFound(let error):
            return error.localizedDescription
        }
    }
}
