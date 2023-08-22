//
//  AppMediator.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/19.
//

import Foundation
import SwiftUI
import CoreModule

protocol NavigationCoordinator {
    //func navigateToUserDetail(from view: MainView)
    func navigateToLogin(from view: AnyView)
    func navigateToMain(from view: LoginView)
    //func navigateToMe(from view: )
}
class AppMediator: ObservableObject, NavigationCoordinator {
    
    
    
    func startView() -> any View {
        let store = Store()
        return RootView().environmentObject(store)
    }
    
    func navigateToLogin(from view: AnyView) {
        
    }
    
    func navigateToMain(from view: LoginView) {
        
    }
    

}
