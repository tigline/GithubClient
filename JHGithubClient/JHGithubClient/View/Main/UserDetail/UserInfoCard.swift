//
//  UserInfoCard.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/18.
//
import SwiftUI

struct UserInfoCard: View {
    let viewModel: UserDetailViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text(viewModel.name)
                .font(.title)
            Text("@\(viewModel.login)")
                .font(.subheadline)
                .foregroundColor(.gray)

            
            HStack {
                VStack {
                    Text("\(viewModel.followers)")
                        .font(.headline)
                    Text("Followers")
                }
                VStack {
                    Text("\(viewModel.following)")
                        .font(.headline)
                    Text("Following")
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.bottom)
    }
}
