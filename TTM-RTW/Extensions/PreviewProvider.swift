//
//  PreviewProvider.swift
//  TTM-RTW
//
//  Created by Tanaka Bere on 03/03/2024.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Ronaldo Cristiano", email: "ronaldo@mail.com", username: "CR7")
    
    let post = Post(ownerUid: "123", caption: "This is a test", timestamp: Timestamp(), likes: 0)
}
