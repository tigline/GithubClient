//
//  UserDetailViewModel.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/18.
//

import Foundation
struct UserDetailViewModel: Identifiable, Codable {
    
    var id: Int{gitHubDetailedUser.id}
    let gitHubDetailedUser:GitHubDetailedUser
    let repos:[GitHubRepo]
    
    init(user:GitHubDetailedUser, repos:[GitHubRepo]) {
        self.gitHubDetailedUser = user
        self.repos = repos
    }
    
    var login:String {gitHubDetailedUser.login}
    var name:String {gitHubDetailedUser.name ?? "UnKnown"}
    var avatarUrl:URL {gitHubDetailedUser.avatarUrl}
    var followers: Int {gitHubDetailedUser.followers ?? 0}
    var following: Int {gitHubDetailedUser.followers ?? 0}
    
    var unforkRepos:[GitHubRepo] {repos.filter{!$0.fork}}
    
}
