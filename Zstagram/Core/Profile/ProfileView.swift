//
//  ProfileView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 26.07.2023.
//

import SwiftUI

struct ProfileView: View {
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        VStack {
            // header
            VStack {
                // image and stats
                HStack {
        NavigationStack {
            ScrollView {
                        HStack(spacing: 8) {
                            UserStateView(value: 3, title: "Posts")
                            UserStateView(value: 12, title: "Followers")
                            UserStateView(value: 24, title: "Following")
                        }
                    
                }
                
                // name and bio
                VStack(alignment: .leading, spacing: 4) {
                    Text("iOS Developer")
                        .fontWeight(.semibold)
                    Text("Fintech")
                LazyVGrid(columns: gridItems, spacing: 1) {
                    ForEach(0 ... 109, id: \.self) { item in
                        Image("Obada")
                            .resizable()
                            .scaledToFill()
                    }
                }
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                // action button
                Button {
                    
                } label: {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(
                            width: 360,
                            height: 32
                        )
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.gray, lineWidth: 1)
                        )
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }

                }
                
                Divider()
            }
            
            // post grid view
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
