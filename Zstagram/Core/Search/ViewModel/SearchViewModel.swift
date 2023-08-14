//
//  SearchViewModel.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 15.08.2023.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    @Published var isLoading = false
    
    init() {
        Task {
            try await fetchAllUsers()
        }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        isLoading = true
        self.users = try await UserService.fetchAllUsers()
        isLoading = false
    }
}
