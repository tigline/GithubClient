//
//  RepoCell.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/18.
//

import SwiftUI
struct RepoCell: View {
    let repo: GitHubRepo

    var body: some View {
        VStack(alignment: .leading) {
            Text(repo.name)
                .font(.headline)
                .padding(.bottom, 3)
            Text(repo.description ?? "None")
                .foregroundColor(.gray)
                .lineLimit(1)
                .padding(.bottom, 2)
            HStack {
                Text(repo.language ?? "UnKnown")
                .font(.subheadline)
                Spacer()
                Text("⭐️ \(repo.stargazersCount)")
            }
        }
        .padding(.all, 5)
    }
}
