//
//  PostGridView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 3.08.2023.
//

import SwiftUI

struct PostGridView: View {
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    let user: User
    var posts: [Post]
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(posts) { post in
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: CGFloat.imageDimension(),
                        height: CGFloat.imageDimension()
                    )
                    .clipped()
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            PostGridView(user: User.MOCK_USERS[0], posts: Post.MOCK_POSTS)
        }
    }
}
