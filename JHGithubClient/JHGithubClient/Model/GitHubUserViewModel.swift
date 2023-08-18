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
    
    var name:String {gitHubUser.login}
    var avatarUrl:URL {gitHubUser.avatarUrl}
    
    
}

extension UserDetaiViewModel:  {
    
    
    
}
