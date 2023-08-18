//
//  RootTab.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/15.
//

import SwiftUI

struct RootTab: View {
    @EnvironmentObject var store: Store

    var viewModel:MeViewModel
    var body: some View {
        TabView(selection: $store.appState.rootTab.selection) {
            UsersView().tabItem {
                Image(systemName: "list.bullet.below.rectangle")
                Text("Users")
            }.tag(AppState.RootTab.Index.list)

            MeView(viewModel: viewModel).tabItem {
                Image(systemName: "gear")
                Text("Me")
            }.tag(AppState.RootTab.Index.settings)
        }
        .edgesIgnoringSafeArea(.top)
        .alert(isPresented: $store.appState.showErrorAlert) {
            Alert(title: Text("Error"),
                  message: Text(store.appState.errorMessage),
                  dismissButton: .default(Text("OK")) {
                      store.dispatch(.dismissError)
                  }
            )
        }
    }
}

//struct RootTab_Previews: PreviewProvider {
//    static var previews: some View {
//        RootTab()
//    }
//}
