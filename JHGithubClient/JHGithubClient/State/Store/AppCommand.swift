//
//  AppCommand.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/16.
//

import Foundation
import Combine

protocol AppCommand {
    func execute(in store: Store)
}

struct LoadLoginUserCommand: AppCommand {
    func execute(in store: Store) {
        let token = SubscriptionToken()
        LoadLoginUserRequest(user: store.appState.login.userId, token: store.appState.login.token)
            .publisher.sink (
                receiveCompletion: { complete in
                    if case .failure(let error) = complete {
                        store.dispatch(.loginDone(result: .failure(error)))
                    }
                    token.unseal()
                }, receiveValue: { value in
                    store.dispatch(.loginDone(result: .success(value)))
                }
            )
            .seal(in: token)
    }
}

struct LoadGithubUserListCommand: AppCommand {
    func execute(in store: Store) {
        let token = SubscriptionToken()
        LoadGitHubUsersRequest(since: 0, perPage: 30, token: store.appState.login.token)
            .publisher.sink (
                receiveCompletion: { complete in
                    if case .failure(let error) = complete {
                        store.dispatch(.loadUserlistDone(result: .failure(error)))
                    }
                    token.unseal()
                }, receiveValue: { value in
                    store.dispatch(.loadUserlistDone(result: .success(value)))
                }
            )
            .seal(in: token)
    }
}

struct LoadGithubUserDetailCommand: AppCommand {
    var name:String
    func execute(in store: Store) {
        let token = SubscriptionToken()
        
        LoadGitHubUserRequest(username: name, token: store.appState.login.token)
            .publisher.sink (
                receiveCompletion: { complete in
                    if case .failure(let error) = complete {
                        store.dispatch(.loadUserDetailDone(result: .failure(error)))
                    }
                    token.unseal()
                }, receiveValue: { value in
                    store.dispatch(.loadUserDetailDone(result: .success(value)))
                }
            )
            .seal(in: token)
        
    }
}


class SubscriptionToken {
    var cancellable: AnyCancellable?
    func unseal() { cancellable = nil }
}

extension AnyCancellable {
    func seal(in token: SubscriptionToken) {
        token.cancellable = self
    }
}
