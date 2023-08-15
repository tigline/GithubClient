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
    @State private var token: String = "tigline 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"

    var body: some View {
        VStack(spacing: 30) {
            Image("githubLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                
            
            Text("登录 GitHub")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            Button(action: {
                
                store.dispatch(.login(token: token))
//                if let url = URL(string: "https://github.com/login/oauth/authorize") {
//                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
//                }
            }) {
                Text("登录")
                    .font(.headline)
                    .frame(width: 280, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
            
            Button(action: {
                
                self.showingTokenAlert = true
            }) {
                Text("输入令牌")
                    .font(.headline)
                    .frame(width: 280, height: 50)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
        }
        .padding()
        .alert(isPresented: $showingTokenAlert) {
            Alert(title: Text("输入令牌"), message: Text("请输入您的 GitHub 令牌"), textField: $token, primaryButton: .default(Text("确定")), secondaryButton: .cancel())
        }
    }
}


extension Alert {
    public init(title: Text, message: Text? = nil, textField: Binding<String>, primaryButton: Alert.Button = .default(Text("确定")), secondaryButton: Alert.Button = .cancel(Text("取消"))) {
        self.init(title: title, message: message, primaryButton: primaryButton, secondaryButton: secondaryButton, textFields: [textField])
    }
    
    public init(title: Text, message: Text? = nil, primaryButton: Alert.Button = .default(Text("确定")), secondaryButton: Alert.Button = .cancel(Text("取消")), textFields: [Binding<String>]) {
        self.init(title: title, message: message, textField: textFields.first!, primaryButton: primaryButton, secondaryButton: secondaryButton)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
