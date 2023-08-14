//
//  LoginViewModel.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 14.08.2023.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(
            withEmail: email,
            password: password
        )
    }
}
