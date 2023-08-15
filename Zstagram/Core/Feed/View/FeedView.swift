//
//  FeedView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 26.07.2023.
//

import SwiftUI
import Kingfisher

struct FeedView: View {
    
    let post: Post
    
    var body: some View {
        VStack {
            if let user = post.user {
                UserImageView(user: user)
            }
            
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxHeight: .infinity)
                .clipShape(Rectangle())
            
            HStack(spacing: 16) {
                
                Button {
                    print("Like Post")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }

                Button {
                    print("Comment on Post")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                
                Button {
                    print("Share Post")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundColor(.black)
            
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            CaptionView(
                name: (post.user?.fullname ?? post.user?.username) ?? "",
                caption: post.caption
            )
            
            Text("\(post.timestamp.dateValue())")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundColor(.gray)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {        
            FeedView(post: .MOCK_POSTS[0])
        }
    }
}
