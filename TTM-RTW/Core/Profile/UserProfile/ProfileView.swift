//
//  ProfileView.swift
//  TTM-RTW
//
//  Created by Tanaka Bere on 28/02/2024.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            // bio and stats
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                
                Button {
                    
                } label: {
                    Text("Add Friend")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                }                
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Featured Playlists")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    // create a view for playlist cards that can be called here. Using Spotify's API, can we call the variable album cover and link it to their account
                    HStack {
                        Image("AlbumCover")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 60)
                        Image("AlbumCover")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 60)
                        Image("AlbumCover")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 60)
                        Image("AlbumCover")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 60)
                        Image("AlbumCover")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 60)
                        
                    }
                }
                .padding(.horizontal)
                
                // user content list view - calendar in future
                UserContentListView(user: user)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
    }
}


struct ProfileView_Preciews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}
