//
//  FeedViewModel.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 15.08.2023.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    @Published var isLoading = false
    
    init() {
        Task {
            try await fetchPosts()
        }
    }
    
    @MainActor
    func fetchPosts() async throws {
        isLoading = true
        self.posts = try await PostService.fetchFeedPosts()
        isLoading = false
    }
}
