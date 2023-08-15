//
//  UserService.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 15.08.2023.
//

import Foundation
import Firebase

struct UserService {
    
    static func fetchUser(withCurrentUId currentUId: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(currentUId).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
}
