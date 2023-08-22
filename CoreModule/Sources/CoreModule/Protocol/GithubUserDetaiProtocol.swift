//
//  File.swift
//  
//
//  Created by Aaron on 2023/8/19.
//

import Foundation
public protocol GithubUserDetaiProtocol:Codable {
    var name: String? { get }
    var company: String? { get }
    var blog: String? { get }
    var location: String? { get }
    var email: String? { get }
    var hireable: Bool? { get }
    var bio: String? { get }
    var twitterUsername: String? { get }
    var publicRepos: Int? { get }
    var publicGists: Int? { get }
    var followers: Int? { get }
    var following: Int? { get }
    var createdAt: Date? { get }
    var updatedAt: Date? { get }
}
