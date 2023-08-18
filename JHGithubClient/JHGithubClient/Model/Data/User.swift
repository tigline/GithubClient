//
//  User.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/15.
//

import Foundation

struct User: Codable {
    let id: Int
    let login: String
    let name: String
    let reposUrl: URL
    let avatarUrl: URL
    let email: String?
    let followers: Int
    let following: Int
    let createdAt: Date
    let location: String?
}
