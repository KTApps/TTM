//
//  NewPostViewModel.swift
//  TTM-RTW
//
//  Created by Tanaka Bere on 04/03/2024.
//

import Firebase

class NewPostViewModel: ObservableObject {
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let post = Post(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await PostService.uploadPost(post)
    }
}
