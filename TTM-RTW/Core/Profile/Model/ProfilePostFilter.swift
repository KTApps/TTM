//
//  ProfilePostFilter.swift
//  TTM-RTW
//
//  Created by Tanaka Bere on 29/02/2024.
//

import Foundation

enum ProfilePostFilter: Int, CaseIterable, Identifiable {
    case posts
    case replies //changed to calendar in future
    // case likes
    
    var title: String {
        switch self {
        case .posts: return "Posts"
        case .replies: return "Replies"
            // case .likes: returm "Likes"
        }
    }
    var id: Int { return self.rawValue}
}
