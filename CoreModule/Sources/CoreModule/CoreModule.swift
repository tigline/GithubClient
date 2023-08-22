// The Swift Programming Language
// https://docs.swift.org/swift-book

struct CoreModule:Mediator {
    
    private let store:Store
    
    init(store:Store) {
        self.store = store
    }
    
    
    func send(_ action: IAppAction, sender: Any?) {
        store.dispatch(.logoutApp)
    }
    
    
}
