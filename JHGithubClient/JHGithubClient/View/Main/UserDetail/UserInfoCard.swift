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
                Spacer()
                VStack {
                    Text("\(viewModel.following)")
                        .font(.headline)
                    Text("Following")
                }
            }.padding(.horizontal, 32)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.bottom)
    }
}

