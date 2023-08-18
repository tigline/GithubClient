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
            Text(repo.description ?? "")
                .foregroundColor(.gray)
                .lineLimit(1)
            HStack {
                Text(repo.language ?? "")
                .font(.subheadline)
                Spacer()
                Text("⭐️ \(repo.stargazersCount)")
            }
        }
        .padding()
        //.background(Color.gray.opacity(0.1))
        //.cornerRadius(10)
    }
}
