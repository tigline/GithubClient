//
//  MeViewModel.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/18.
//

import Foundation

struct MeViewModel: Identifiable, Codable {
    var id:Int {user.id}
    
    let user:User
    init(user:User) {
        self.user = user
    }
    
    var name:String {user.name}
    var login:String {user.login}
    var email:String {user.email ?? ""}
    var avatar:URL {user.avatarUrl}
    var followers: Int {user.followers}
    var following: Int {user.following}
    var createdAt: Date {user.createdAt}
    var location: String {user.location ?? "UnKnown"}
}
