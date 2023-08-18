//
//  UserCell.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/17.
//

import SwiftUI

struct UserCell: View {
    var viewModel: GitHubUserViewModel

    var body: some View {
        VStack {
            HStack {
                // avatar
                
                AsyncImage(url: viewModel.avatarUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                } placeholder: {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                }
                
                
                // name
                Text(viewModel.login)
                    .font(.title2)
                    .padding(.leading, 8)
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding(.all, 10)
            .background(.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            
        }.padding(.horizontal,16)
    }
}




//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCell(viewModel: GitHubUserViewModel(user: GitHubUser))
//    }
//}

