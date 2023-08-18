//
//  UserDetail.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/17.
//

import SwiftUI

struct UserDetail: View {
    @EnvironmentObject var store: Store
    var id:Int
    var user:String
    var viewModel: UserDetailViewModel? {
        store.appState.userList.detailedUsers[id]
    }
    
        
    
    var body: some View {
        if let viewModel = viewModel {
                VStack {
                    List {
                        Section(header:
                            VStack(spacing: 16) {
                                AvatarCard(url: viewModel.avatarUrl)
                                    .frame(height: 200)
                                UserInfoCard(viewModel: viewModel)
                            }
                            
                        ) {
                            Text("Repositories:")
                                .font(.title2)
                                .padding(.leading)
                            
                            ForEach(viewModel.unforkRepos) { repo in
                                NavigationLink(destination: SafariView(
                                    url: repo.htmlUrl,
                                    onFinished: {  }
                                ).navigationBarTitle(Text(repo.name), displayMode: .inline)
                                ) {
                                    RepoCell(repo: repo)
                                }
                            }
                        }
                    }
                    .listStyle(GroupedListStyle())
                }
                .background(Color.white)
                .navigationTitle("User Detail")
                .onAppear {
                    loadDetail()
                }
            } else {
            if store.appState.userList.userListLoadingError != nil {
                RetryButton {
                    loadDetail()
                }.offset(y: -40)
            } else {
                LoadingView()
                    .offset(y: -40)
                    .onAppear {
                        loadDetail()
                    }
            }
        }

    }
    
    func loadDetail() {
        self.store.dispatch(.loadUserDetail(userId: user))
    }

}

//struct UserDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetail()
//    }
//}
