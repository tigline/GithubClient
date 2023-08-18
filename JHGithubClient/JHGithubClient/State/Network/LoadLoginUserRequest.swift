//
//  LoadLoginUserRequest.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/18.
//

import Foundation
import Combine

struct LoadLoginUserRequest {
    let user: String
    let token: String
    
    var publisher: AnyPublisher<User, AppError> {
        userPublisher(user, token)
            .receive(on: DispatchQueue.main)
            .mapError { AppError.networkingFailed($0) }
            .eraseToAnyPublisher()
    }

    private func userPublisher(_ user: String, _ token:String) -> AnyPublisher<User, Error> {
        guard let url = URL(string: "https://api.github.com/user") else {
            fatalError("Invalid URL")
        }

        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/vnd.github+json", forHTTPHeaderField: "Accept")
        request.setValue("2022-11-28", forHTTPHeaderField: "X-GitHub-Api-Version")
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .map { data, response -> Data in
                if let string = String(data: data, encoding: .utf8) {
                    print("Received User JSON: \(string)")
                }
                return data
            }
            .decode(type: User.self, decoder: appDecoder)
            .eraseToAnyPublisher()
    }
}
