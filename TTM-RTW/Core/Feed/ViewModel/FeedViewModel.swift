//
//  FeedViewModel.swift
//  TTM-RTW
//
//  Created by Tanaka Bere on 04/03/2024.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchPosts()
        try await fetchUserDataForPosts()
    }
    
    private func fetchUserDataForPosts() async throws {
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            
            posts[i].user = postUser
        }
        }
}
