// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import CoreModule

struct LoginModule: Mediator {
    
    var mediator: Mediator
        
    init(mediator: Mediator) {
        self.mediator = mediator
    }
    
    func send(_ action: IAppAction, sender: Any?) {
        
    }

}
