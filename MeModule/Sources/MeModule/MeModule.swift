// The Swift Programming Language
// https://docs.swift.org/swift-book
import CoreModule
import Combine
import Foundation

struct MeState: IAppState {
    var meInfo = MeInfo()
}

extension MeState {
    struct MeInfo {
        enum loginState: CaseIterable {
            case loginOut, login
        }
        //var userLoginError: AppError?
        var isLoading:Bool = false
        var userId: String = ""
        var token: String = ""
        var loginState:loginState = .loginOut
        //var user:User?

    }
}

enum MeAction: IAppAction {
    case logout
}



struct MeCommand: AppCommand {
    func execute<T>(in store: T) where T : AppStore{}
}




class MeStore: ObservableObject, AppStore {

    @Published var meState = MeState()
    private var disposeBag = Set<AnyCancellable>()
    private var store:any AppStore
    
    init(_ store:any AppStore) {
        self.store = store
    }
    
    func dispatch(_ action: MeAction) {
        print("[ACTION]: \(action)")
        let result = MeStore.reduce(state: &meState, action: action)
        meState = result.0
        if let command = result.1 {
            print("[COMMAND]: \(command)")
            command.execute(in: self)
        }
    }
    
    static func reduce(state: inout MeState, action: MeAction) -> (MeState, AppCommand?) {
        var meState = state
        var appCommand: AppCommand? = nil
        
        switch action {

        case .logout:

            store.dispatch(AppStore.Action)
            break
        }
        
        return (meState, appCommand)
    }

}
