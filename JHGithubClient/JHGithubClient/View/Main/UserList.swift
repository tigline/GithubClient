//
//  UserList.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/16.
//

import SwiftUI

import SwiftUI

struct UserList: View {

    @EnvironmentObject var store: Store
    var userList: AppState.UserList { store.appState.userList }
    @State private var isUserDetailActive = false
    @State private var selectedUserID: Int?
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ZStack{
                    TextField("Search", text: $store.appState.userList.searchText.animation(nil))
                        .frame(height: 40)
                        .padding(.horizontal, 8)
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.gray, style: StrokeStyle(lineWidth: 1))
                                
                            }
                        )
                }

                .padding(.horizontal, 16)

                ForEach(userList.displayUsers()) { user in
                    
                    NavigationLink {
                        
                        UserDetail(id:user.id, user: user.login)
                        
                    } label: {
                        UserCell(viewModel: user)
                            .padding(.vertical, 4)
                            
                    }.navigationTitle("GitHubUsers")

                    
                }
            }
            Spacer()
                .frame(height: 8)
        }
        
    }
}
//struct UserList_Previews: PreviewProvider {
//    static var previews: some View {
//        UserList()
//    }
//}
