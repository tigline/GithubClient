//
//  RootTab.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/15.
//

import SwiftUI

struct RootTab: View {
    @EnvironmentObject var store: Store
//    private var userListBinding:Binding<AppState.UserList> {
//        $store.appState.userList
//    }
    var body: some View {
        TabView(selection: $store.appState.rootTab.selection) {
            UsersView().tabItem {
                Image(systemName: "list.bullet.below.rectangle")
                Text("Users")
            }.tag(AppState.RootTab.Index.list)

            MeView().tabItem {
                Image(systemName: "gear")
                Text("Me")
            }.tag(AppState.RootTab.Index.settings)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct RootTab_Previews: PreviewProvider {
    static var previews: some View {
        RootTab()
    }
}
