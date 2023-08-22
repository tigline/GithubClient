//
//  File.swift
//  
//
//  Created by Aaron on 2023/8/19.
//

import Foundation

public protocol AppCommand {
    func execute<T:AppStore>(in store: T)
}

//struct AppCommand:IAppCommand {
//    func execute<T>(in store: T) where T : AppStore {
//
//    }
//}
