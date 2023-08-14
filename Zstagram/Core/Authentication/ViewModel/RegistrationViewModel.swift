//
//  RegistrationViewModel.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 14.08.2023.
//

import Foundation
import Combine

class RegistrationViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(
            email: email,
            password: password,
            username: username
        )
    }
}
