//
//  User.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 1.08.2023.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUId = Auth.auth().currentUser?.uid else { return false }
        return currentUId == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        User(
            id: NSUUID().uuidString,
            username: "Obadasemary",
            profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/zstagram.appspot.com/o/profile_images%2F5Cv4s520AAZfQ6AEybolh7WUgV72%2FEF4D1B61-F645-4F53-9C87-13D968AC58D2?alt=media&token=7e192c2f-c8de-414f-9c1e-3f001ff2f553",
            fullname: "Abdelrahman Mohamed",
            bio: "Senior iOS Developer | FinTech | E-Commerce Mobile Solutions",
            email: "obada.semary@gmail.com"
        ),
        User(
            id: NSUUID().uuidString,
            username: "Batman",
            profileImageUrl: nil,
            fullname: "Bruce Wayne",
            bio: "Gotham's Dark Knight",
            email: "batman@gmail.com"
        ),
        User(
            id: NSUUID().uuidString,
            username: "Spiderman",
            profileImageUrl: nil,
            fullname: "Peter Parker",
            bio: "Spiderman",
            email: "spiderman@gmail.com"
        ),
        User(
            id: NSUUID().uuidString,
            username: "Thor",
            profileImageUrl: nil,
            fullname: nil,
            bio: "Thor",
            email: "thor@gmail.com"
        ),
        User(
            id: NSUUID().uuidString,
            username: "Ironman",
            profileImageUrl: nil,
            fullname: "Tony Stark",
            bio: "Ironman",
            email: "ironman@gmail.com"
        )
    ]
}
