//
//  User.swift
//  TTM-RTW
//
//  Created by Tanaka Bere on 01/03/2024.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
