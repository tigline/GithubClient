//
//  UsersView.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/16.
//

import SwiftUI

struct UsersView: View {
    @EnvironmentObject var store:Store
    
    var body: some View {
        NavigationView{
            if store.appState.userList.users == nil {
                if store.appState.userList.userListLoadingError != nil {
                    RetryButton {
                        self.store.dispatch(.loadUserlist)
                    }.offset(y: -40)
                } else {
                    LoadingView()
                        .offset(y: -40)
                        .onAppear {
                            self.store.dispatch(.loadUserlist)
                        }
                }
            } else {
                UserList()
                    .navigationBarTitle("GitHubUsers")
            }
        }
    }
    
    
    
}



struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}

struct RetryButton: View {

    let block: () -> Void

    var body: some View {
        Button(action: {
            self.block()
        }) {
            HStack {
                Image(systemName: "arrow.clockwise")
                Text("Retry")
            }
            .font(.system(size: 16, weight: .regular))
            .foregroundColor(.gray)
            .padding(6)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray)
            )
        }
    }
}
