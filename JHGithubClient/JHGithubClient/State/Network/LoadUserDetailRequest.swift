//
//  LoadUserDetailRequest.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/17.
//
import Foundation
import Combine

struct LoadGitHubUserRequest {
    let username: String
    let token: String
    var publisher: AnyPublisher<UserDetailViewModel, AppError> {
        userPublisher(username,token)
            .flatMap { self.reposPublisher($0) }
            .map { UserDetailViewModel(user: $0, repos: $1)}
            .mapError { AppError.networkingFailed($0) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    private func userPublisher(_ username: String, _ token:String) -> AnyPublisher<GitHubDetailedUser, Error> {
        
        guard let url = URL(string: "https://api.github.com/users/\(username)") else {
            fatalError("Invalid URL")
        }
        var request = URLRequest(url: url)
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.setValue("2022-11-28", forHTTPHeaderField: "X-GitHub-Api-Version")
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map { data, response -> Data in
                if let string = String(data: data, encoding: .utf8) {
                    print("Received GitHubDetailedUser JSON: \(string)")
                }
                return data
            }
            .decode(type: GitHubDetailedUser.self, decoder: appDecoder)
            .eraseToAnyPublisher()
    }

    func reposPublisher(_ user: GitHubDetailedUser) -> AnyPublisher<(GitHubDetailedUser,[GitHubRepo]), Error> {
        URLSession.shared
            .dataTaskPublisher(for: user.reposUrl)
            .map { data, response -> Data in
                if let string = String(data: data, encoding: .utf8) {
                    print("Received GitHubRepo JSON: \(string)")
                }
                return data
            }
            .decode(type: [GitHubRepo].self, decoder: appDecoder)
            .map {(user, $0)}
            .eraseToAnyPublisher()
    }
}

