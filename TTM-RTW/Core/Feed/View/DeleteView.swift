//
//  DeleteView.swift
//  TTM-RTW
//
//  Created by Tanaka Bere on 05/03/2024.
//

import SwiftUI

struct DeleteFeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
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
        }
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

struct DeleteFeedView_Preciews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
        FeedView()
    }
}
}
