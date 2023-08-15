//
//  PostGridViewModel.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 16.08.2023.
//

import Foundation

class PostGridViewModel: ObservableObject {
    
    private let user: User
    @Published var posts = [Post]()
    @Published var isLoading = false
    
    init(user: User) {
        self.user = user
        
        Task {
            try await fetchUserPosts()
        }
    }
    
    @MainActor
    func fetchUserPosts() async throws {
        isLoading = true
        
        self.posts = try await PostService.fetchUserPosts(uid: user.id)
        
        for i in 0 ..< posts.count {
            posts[i].user = self.user
        }
        
        isLoading = false
    }
}
