//
//  User.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 1.08.2023.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
}

extension User {
    static var MOCK_USERS: [User] = [
        User(
            id: NSUUID().uuidString,
            username: "Obada",
            profileImageUrl: "obada",
            fullname: "Abdelrahman Mohamed",
            bio: "Senior iOS Developer | FinTech | E-Commerce Mobile Solutions",
            email: "obada.semary@gmail.com"
        ),
        User(
            id: NSUUID().uuidString,
            username: "Batman",
            profileImageUrl: "batman",
            fullname: "Bruce Wayne",
            bio: "Gotham's Dark Knight",
            email: "batman@gmail.com"
        ),
        User(
            id: NSUUID().uuidString,
            username: "Spiderman",
            profileImageUrl: "spiderman",
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
            profileImageUrl: "ironman",
            fullname: "Tony Stark",
            bio: "Ironman",
            email: "ironman@gmail.com"
        )
    ]
}
