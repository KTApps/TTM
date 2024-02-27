//
//  AddFriendsViewModel.swift
//  TTM-RTW
//
//  Created by Tanaka Bere on 03/03/2024.
//

import Foundation

class AddFriendsViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers() }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
