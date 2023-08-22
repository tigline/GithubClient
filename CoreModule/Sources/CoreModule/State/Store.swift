//
//  File.swift
//  
//
//  Created by Aaron on 2023/8/19.
//

import Foundation
import Combine

class Store: ObservableObject, AppStore {

    @Published var appState = AppState()
    private var disposeBag = Set<AnyCancellable>()



    func dispatch(_ action: AppAction) {
        print("[ACTION]: \(action)")
        let result = Store.reduce(state: &appState, action: action)
        appState = result.0
        if let command = result.1 {
            print("[COMMAND]: \(command)")
            command.execute(in: self)
        }
    }


    
    static func reduce(state: inout AppState, action: AppAction) -> (AppState, AppCommand?) {
        
        var appState = state
        var appCommand: AppCommand? = nil
        switch action {
        case .logoutApp:
            
            break
        }
        
        
        return (appState, appCommand)
        
    }
    
//    static func reduce<T: IAppState>(state: inout T, action: IAppAction) -> (IAppState, AppCommand?) {
//        // ... implementation ...
//        // 返回新的state和可能的命令
//    }

}
