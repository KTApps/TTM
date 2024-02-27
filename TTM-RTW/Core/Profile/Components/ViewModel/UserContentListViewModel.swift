//
//  UserContentListViewModel.swift
//  TTM-RTW
//
//  Created by Tanaka Bere on 04/03/2024.
//

import Foundation

class UserContentListViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    let user: User
    
    init(user: User) {
        self.user = user
        Task { try await fetchUserPosts() }
    }
    
    @MainActor
    func fetchUserPosts() async throws {
        var posts = try await PostService.fetchUserPosts(uid: user.id)
        
        for i in 0 ..< posts.count {
            posts[i].user = self.user
        }
        
        self.posts = posts
    }
}
