//
//  Delete.swift
//  TTM-RTW
//
//  Created by Tanaka Bere on 05/03/2024.
//

import SwiftUI

struct DeletePostCell: View {
    let post: Post
    
    // here i tried to make the post cell look just like the FIGMA. Last thing to do (which i had trouble with) is to make the like and comment section at the very bottom of the cell. literally right on top of the divider like the album cover placeholder is.
    // if you could figure that out it would be great bro
    // i would like to have it perfect here before copy and pasting it into the PostCell view.
    
    var body: some View {
        VStack {
            HStack { //}(alignment: .top) {
                CircularProfileImageView(user: post.user, size: .xSmall)
                
                Text(post.user?.username ?? "") // username
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Text(post.timestamp.timestampString()) // timestamp
                    .font(.caption)
                    .foregroundColor(Color(.systemGray3))
                
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis") // ellipsis
                        .foregroundColor(Color(.darkGray))
                }
            }
            VStack {
                HStack (spacing: 5) {
                    
                    Image("AlbumCover")
                    
                    VStack {
                        Text ("SongTitle - ArtistName")
                            .font(.footnote)
                            .frame(maxWidth: .infinity, alignment: .topLeading )
                        
                        Text(post.caption)
                            .font(.footnote)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // maybe if HStack below is placed outside VStack for song title it would move the like and comment section to the bottom right corner - cannot do because my preview is not loading
                        
                        HStack(spacing: 7) {
                            Button {
                                // toggle like
                            } label: {
                                Image(systemName: "heart")
                            }
                            Button {
                                // toggle comments - .sheet()
                            } label: {
                                Image(systemName: "bubble.right")
                            }
                        }
                        .foregroundColor(.black)
                        .padding(.vertical, 15)
                        .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                    }
                }
            }
            Divider()
        }
        .padding(8)
    }
}

struct DeletePostCellView_Preciews: PreviewProvider {
    static var previews: some View {
        DeletePostCell(post: dev.post)
    }
}
