//
//  GithubUser.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/15.
//

import Foundation
import CoreModule

struct GitHubUser: GithubUserProtocol {
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

}








