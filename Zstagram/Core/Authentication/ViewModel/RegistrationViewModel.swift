//
//  RegistrationViewModel.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 14.08.2023.
//

import Foundation
import Combine

@MainActor
class RegistrationViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    
    func createUser() async throws {
        isLoading = true
        try await AuthService.shared.createUser(
            email: email,
            password: password,
            username: username
        )
        isLoading = false
    }
}
