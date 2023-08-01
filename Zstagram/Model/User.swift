//
//  User.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 1.08.2023.
//

import Foundation

struct User: Identifiable, Codable {
    
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let eamil: String
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(
            id: NSUUID().uuidString,
            username: "Obada",
            profileImageUrl: "Obada",
            fullname: "Abdelrahman Mohamed",
            bio: "Senior iOS Developer",
            eamil: "obada.semary@gmail.com"
        ),
        .init(
            id: NSUUID().uuidString,
            username: "Batman",
            profileImageUrl: "batman",
            fullname: "Bruce Wayne",
            bio: "Gotham's Dark Knight",
            eamil: "batman@gmail.com"
        ),
        .init(
            id: NSUUID().uuidString,
            username: "Spiderman",
            profileImageUrl: "spiderman",
            fullname: "Peter Parker",
            bio: "Spiderman",
            eamil: "spiderman@gmail.com"
        ),
        .init(
            id: NSUUID().uuidString,
            username: "Thor",
            profileImageUrl: nil,
            fullname: nil,
            bio: "Thor",
            eamil: "thor@gmail.com"
        ),
        .init(
            id: NSUUID().uuidString,
            username: "Ironman",
            profileImageUrl: "ironman",
            fullname: "Tony Stark",
            bio: "Ironman",
            eamil: "ironman@gmail.com"
        )
    ]
}
