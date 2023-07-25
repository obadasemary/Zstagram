//
//  ProfileView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 26.07.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            // header
            VStack {
                // image and stats
                HStack {
                    
                }
                
                // name and bio
                VStack {
                    Text("iOS Developer")
                    
                    Text("Fintech")
                }
                
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
