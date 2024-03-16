//
//  PostCell.swift
//  TTM-RTW
//
//  Created by Tanaka Bere on 28/02/2024.
//

import SwiftUI

// represents each of the feed view items, place each of the post cells inside the for each loop to render each post on the screen

struct PostCell: View {
    let post: Post
    @State var likeCount = 0
    @State var commentCount = 0
    @State var repostCount = 0
    
    @State var isCommentSheetVisible = false
    var body: some View {
       VStack {
            HStack { //}(alignment: .top, spacing: 12) {
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
    
                    HStack (spacing: 10) { // HStack for variables
                        
                        Image("AlbumCover")
                        
                        Text(post.caption)
                            .font(.footnote)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    // HStack below should be within the HStack above but aligned to the bottom right of the cell - i would change it now but my previews is not loading
                    HStack {
                        Button {
                            likeCount += 1
                        } label: {
                            Image(systemName: "heart")
                        }
                        Text("\(likeCount)")
                        
                        Spacer()
                            .frame(width: 20)
                        
                        Button {
                            commentCount += 1
                            isCommentSheetVisible = true
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        .sheet(isPresented: $isCommentSheetVisible) {
                            ActivityView()
                                .presentationDetents([.medium, .fraction(3/4)])
                        }
                        Text("\(commentCount)")
                        
                        Spacer()
                            .frame(width: 20)
                        
                        Button {
                            repostCount += 1
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        Text("\(repostCount)")
                    }
                    .foregroundColor(.gray)
                    .padding(.vertical, 1)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Divider()
                }
                .padding(10)
            }
        }
  //  }
//}


struct PostCellView_Preciews: PreviewProvider {
    static var previews: some View {
        PostCell(post: dev.post)
    }
}
