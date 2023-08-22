//
//  GitHubDetailedUser.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/18.
//

import Foundation
import CoreModule

struct GitHubDetailedUser: GithubUserProtocol, GithubUserDetaiProtocol {

    
    let login: String
    let id: Int
    let nodeId: String
    let avatarUrl: URL
    let gravatarId: String
    let url: URL
    let htmlUrl: URL
    let followersUrl: URL
    let followingUrl: String
    let gistsUrl: String
    let starredUrl: String
    let subscriptionsUrl: URL
    let organizationsUrl: URL
    let reposUrl: URL
    let eventsUrl: String
    let receivedEventsUrl: URL
    let type: String
    let siteAdmin: Bool

    let name: String?
    let company: String?
    let blog: String?
    let location: String?
    let email: String?
    let hireable: Bool?
    let bio: String?
    let twitterUsername: String?
    let publicRepos: Int?
    let publicGists: Int?
    let followers: Int?
    let following: Int?
    let createdAt: Date?
    let updatedAt: Date?


}
