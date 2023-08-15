//
//  RootView.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/15.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var store: Store

    var body: some View {
        switch store.appState.viewRouter.currentPage {
        case .login:
            LoginView()
        case .main:
            RootTab()
        }
    }
}
