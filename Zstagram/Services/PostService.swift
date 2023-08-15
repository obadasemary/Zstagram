//
//  PostService.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 15.08.2023.
//

import Foundation
import Firebase

struct PostService {
    
    static func fetchPosts() async throws -> [Post] {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: Post.self) })
    }
}
