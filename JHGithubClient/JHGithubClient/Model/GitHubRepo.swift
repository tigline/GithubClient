//
//  GitHubRepo.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/17.
//

import Foundation

struct GitHubRepo: Codable {
    let name: String
    let language: String?
    let stargazersCount: Int
    let description: String?
    let fork: Bool
}
