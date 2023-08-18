//
//  GithubUser.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/15.
//

import Foundation

protocol GithubUserProtocol: Codable {
    var login: String { get }
    var id: Int { get }
    var nodeId: String { get }
    var avatarUrl: URL { get }
    var gravatarId: String { get }
    var url: URL { get }
    var htmlUrl: URL { get }
    var followersUrl: URL { get }
    var followingUrl: String { get }
    var gistsUrl: String { get }
    var starredUrl: String { get }
    var subscriptionsUrl: URL { get }
    var organizationsUrl: URL { get }
    var reposUrl: URL { get }
    var eventsUrl: String { get }
    var receivedEventsUrl: URL { get }
    var type: String { get }
    var siteAdmin: Bool { get }
    
}

protocol GithubUserDetaiProtocol:Codable {
    var name: String? { get }
    var company: String? { get }
    var blog: String { get }
    var location: String? { get }
    var email: String? { get }
    var hireable: Bool? { get }
    var bio: String? { get }
    var twitterUsername: String? { get }
    var publicRepos: Int { get }
    var publicGists: Int { get }
    var followers: Int { get }
    var following: Int { get }
    var createdAt: Date { get }
    var updatedAt: Date { get }
}



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
    let blog: String
    let location: String?
    let email: String?
    let hireable: Bool?
    let bio: String?
    let twitterUsername: String?
    let publicRepos: Int
    let publicGists: Int
    let followers: Int
    let following: Int
    let createdAt: Date
    let updatedAt: Date


}



