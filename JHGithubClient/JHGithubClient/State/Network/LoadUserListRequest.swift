//
//  LoadUserListRequest.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/15.
//
import Foundation
import Combine


struct LoadGitHubUsersRequest {
    let since: Int
    let perPage: Int
    let token: String
    
    var publisher: AnyPublisher<[GitHubUser], Error> {
        usersPublisher(since, perPage, token)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    private func usersPublisher(_ since: Int, _ perPage: Int, _ token:String) -> AnyPublisher<[GitHubUser], Error> {
        guard let url = URL(string: "https://api.github.com/users?since=\(since)&per_page=\(perPage)") else {
            fatalError("Invalid URL")
        }

        var request = URLRequest(url: url)
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.setValue("2022-11-28", forHTTPHeaderField: "X-GitHub-Api-Version")
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: [GitHubUser].self, decoder: appDecoder)
            .eraseToAnyPublisher()
    }
}
