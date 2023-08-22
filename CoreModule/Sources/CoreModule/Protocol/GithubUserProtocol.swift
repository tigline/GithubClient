//
//  File.swift
//  
//
//  Created by Aaron on 2023/8/19.
//

import Foundation
public protocol GithubUserProtocol: Codable {
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
