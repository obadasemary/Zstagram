//
//  Post.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 3.08.2023.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    
    let id: String
    var ownerUid: String
    var caption: String
    var likes: Int
    var imageUrl: String
    let timestamp: Date
    var user: User?
    
    init(
        id: String,
        ownerUid: String,
        caption: String,
        likes: Int,
        imageUrl: String,
        timestamp: Date,
        user: User? = nil
    ) {
        self.id = id
        self.ownerUid = ownerUid
        self.caption = caption
        self.likes = likes
        self.imageUrl = imageUrl
        self.timestamp = timestamp
        self.user = user
    }
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        Post(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Sony Stadio",
            likes: 123,
            imageUrl: "sonyStudio",
            timestamp: Date(),
            user: User.MOCK_USERS[0]
        ),
        Post(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "What a wanderfull snow ❆🏂",
            likes: 123,
            imageUrl: "snow1",
            timestamp: Date(),
            user: User.MOCK_USERS[1]
        ),
        Post(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Iron Man is comming",
            likes: 123,
            imageUrl: "ironman",
            timestamp: Date(),
            user: User.MOCK_USERS[4]
        ),
        Post(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Thor",
            likes: 123,
            imageUrl: "thor",
            timestamp: Date(),
            user: User.MOCK_USERS[3]
        ),
        Post(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Wooow Amazing Bridge",
            likes: 123,
            imageUrl: "wooow",
            timestamp: Date(),
            user: User.MOCK_USERS[2]
        ),
        Post(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "I love this car",
            likes: 123,
            imageUrl: "car1",
            timestamp: Date(),
            user: User.MOCK_USERS[1]
        ),
        Post(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "My car better than Batman's Car",
            likes: 123,
            imageUrl: "car00",
            timestamp: Date(),
            user: User.MOCK_USERS[0]
        ),
        Post(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Building the next-generation E-commerce mobile solution For Watches.",
            likes: 123,
            imageUrl: "Cardial",
            timestamp: Date(),
            user: User.MOCK_USERS[0]
        ),
        Post(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Sony Stadio",
            likes: 1203,
            imageUrl: "sonyStudio",
            timestamp: Date(),
            user: User.MOCK_USERS[4]
        ),
        Post(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "I am happy to annouce that I worked in D360, In a marvelous team of 15 iOS engineers, to build the next generation FinTech mobile solution. \nWe're working based on a multi-modular architecture, enabling 7 active squads to simultaneously contribute to the code base, reducing conflicts & increasing reusability, aspiring to best-in-market user experience.",
            likes: 1413,
            imageUrl: "d360",
            timestamp: Date(),
            user: User.MOCK_USERS[0]
        ),
        Post(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Batman",
            likes: 13,
            imageUrl: "batman",
            timestamp: Date(),
            user: User.MOCK_USERS[1]
        ),
        Post(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "I am in a love with See",
            likes: 23,
            imageUrl: "see",
            timestamp: Date(),
            user: User.MOCK_USERS[0]
        ),
    ]
}
