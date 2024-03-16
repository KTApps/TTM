//
//  LoginViewModel.swift
//  TTM-RTW
//
//  Created by Tanaka Bere on 01/03/2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login() async throws {
       try await AuthService.shared.login(withEmail: email, password: password)
    }
}
