//
//  MeView.swift
//  JHGithubClient
//
//  Created by Aaron on 2023/8/16.
//

import SwiftUI

struct MeView: View {
    @EnvironmentObject var store: Store

    var viewModel: MeViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                   
                    AvatarCard(url: viewModel.avatar)
                        .frame(width: 150, height: 150)

                  
                    VStack(spacing: 10) {
                        Text(viewModel.name)
                            .font(.title)
                        
                        HStack {
                            Text("Email:")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Spacer()
                            Text(viewModel.email)
                                .font(.subheadline)
                        }
                        
                        HStack {
                            Text("Location:")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Spacer()
                            Text(viewModel.location)
                                .font(.subheadline)
                        }

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

                        Text("Joined on \(formattedDate(date: viewModel.createdAt))")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    .padding(.bottom)
                    .padding(.horizontal, 16)

                    
                    Spacer()

                    Button(action: {
                        store.dispatch(.logout)
                    }) {
                        Text("Log Out")
                            .foregroundColor(.white)
                            .frame(width: 200, height: 50)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                }
                //.padding()
            }
            .navigationTitle(viewModel.login)
        }
    }

    func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}



//struct MeView_Previews: PreviewProvider {
//    static var previews: some View {
//        MeView()
//    }
//}
