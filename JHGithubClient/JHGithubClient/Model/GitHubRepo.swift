//
//  GitHubRepo.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/17.
//

import Foundation

struct GitHubRepo:Identifiable, Codable {

    let id:Int
    let name: String
    let language: String?
    let stargazersCount: Int
    let description: String?
    let htmlUrl: URL
    let fork: Bool
}
