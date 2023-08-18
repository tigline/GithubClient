//
//  GitHubUserViewModel.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/17.
//

import Foundation

struct GitHubUserViewModel: Identifiable, Codable {
    
    var id: Int{gitHubUser.id}
    let gitHubUser:GitHubUser
    
    init(user:GitHubUser) {
        self.gitHubUser = user
    }
    
    var login:String {gitHubUser.login}
    var avatarUrl:URL {gitHubUser.avatarUrl}
    
}

struct UserDetailViewModel: Identifiable, Codable {
    
    var id: Int{gitHubDetailedUser.id}
    let gitHubDetailedUser:GitHubDetailedUser
    let repos:[GitHubRepo]
    
    init(user:GitHubDetailedUser, repos:[GitHubRepo]) {
        self.gitHubDetailedUser = user
        self.repos = repos
    }
    
    var login:String {gitHubDetailedUser.login}
    var name:String {gitHubDetailedUser.name ?? ""}
    var avatarUrl:URL {gitHubDetailedUser.avatarUrl}
    var followers: Int {gitHubDetailedUser.followers ?? 0}
    var following: Int {gitHubDetailedUser.followers ?? 0}
    
    var unforkRepos:[GitHubRepo] {repos.filter{!$0.fork}}
    
}
