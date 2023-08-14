//
//  LoginViewModel.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 14.08.2023.
//

import Foundation
import Combine

@MainActor
class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    
    func signIn() async throws {
        isLoading = true
        
        try await AuthService.shared.login(
            withEmail: email,
            password: password
        )
        
        isLoading = false
    }
    
    func signOut() {
        isLoading = true
        
        AuthService.shared.signout()
        
        isLoading = false
    }
}
