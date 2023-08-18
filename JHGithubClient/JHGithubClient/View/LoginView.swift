//
//  LoginView.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/15.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var store:Store
    @State private var showingTokenAlert: Bool = false
    @State private var username: String = ""
    @State private var token: String = ""
    private var login: AppState.Login {
        store.appState.login
    }

    var body: some View {
        VStack(spacing: 30) {
            Image("githubLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .background(.black)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 5)
                )
                .shadow(radius: 7)
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 20))
            Text("Sign in GitHub")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            TextField("GitHub Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 32)

            SecureField("Token, Pasted here", text: $token)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 32)
                
            Button("Login", action: {
                store.dispatch(.login(user: username, token: token))
            })
                .disabled(login.isLoading)
            

            if login.isLoading {
                ProgressView()
            }

            Button(action: {
                store.dispatch(.defaultLogin)
            }) {
                Text("Default User")
                    .font(.headline)
                    .frame(width: 280, height: 50)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
            
        }
        .padding()
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



//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
