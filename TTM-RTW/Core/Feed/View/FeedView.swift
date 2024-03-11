//
//  FeedView.swift
//  TTM-RTW
//
//  Created by Tanaka Bere on 28/02/2024.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationView {
            // Navigatable view that allows us to go from feed to different screens. e.g. click profile picture to go to profile
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    // Only load items currently on screen, not rendering all views - more efficient
                    ForEach(viewModel.posts) { post in
                        PostCell(post: post)
                    }
                }
            }
            .refreshable {
                Task { try await viewModel.fetchPosts() }
            }
            .navigationTitle("TTM")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 1) {
                        NavigationLink {
                            ActivityView()
                        } label: {
                            Image(systemName: "heart")
                                .foregroundColor(.black)
                                .font(.callout)
                                .fontWeight(.semibold)
                        }
                        
                        NavigationLink {
                            AddFriendsView()
                        } label: {
                            Image(systemName: "person.fill.badge.plus")
                                .foregroundColor(.black)
                                .font(.callout)
                        }
                    }
                }
            }
        }
    }
}

struct FeedView_Preciews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
