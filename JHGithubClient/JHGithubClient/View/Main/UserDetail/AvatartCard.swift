//
//  AvatartCard.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/18.
//

import SwiftUI

struct AvatarCard: View {
    let url: URL

    var body: some View {
        AsyncImage(url: url) { image in
            image.resizable().scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .clipShape(Circle())
        .overlay(
            Circle().stroke(Color.white, lineWidth: 4)
        )
        .shadow(radius: 7)
        .padding()
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.bottom)
    }
}



