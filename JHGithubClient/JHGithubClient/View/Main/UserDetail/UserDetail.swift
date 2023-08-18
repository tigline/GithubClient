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
    var viewModel: UserDetailViewModel? {
        store.appState.userList.detailedUsers[id]
    }
    
    var userDetail:
    var body: some View {
        
    }
}

struct UserDetail_Previews: PreviewProvider {
    static var previews: some View {
        UserDetail()
    }
}
