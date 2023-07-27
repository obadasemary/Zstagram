//
//  FeedView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 26.07.2023.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        VStack {
            
            UserImageView(image: "Obada", name: "Abdelrahman Mohamed")
            
            Image("sonyStudio")
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
            
            Text("23 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            CaptionView(
                name: "Abdelrahman Mohamed",
                caption: "HUGE: Sony gearing up to take acquisitions, investments and joint ventures seriously as their job listings  is seek to hire a  Corporate Strategy and Development-Integration and Acceleration candidate for this purpose 🚀 What type of acquisitions/investments to grow with #PlayStation Studios do you hope to see in the future?😎"
            )
            
            Text("6h ago")
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
            FeedView()
        }
    }
}
