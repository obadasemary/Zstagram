//
//  UserImageWithNameView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 28.07.2023.
//

import SwiftUI

struct UserImageWithNameView: View {
    
    let user: User
    
    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .xSmall)
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .fontWeight(.semibold)
                
                if let userfullname = user.fullname {
                    Text(userfullname)
                }
            }
            .font(.footnote)
            
            Spacer()
        }
        .foregroundColor(.black)
        .padding(.horizontal)
    }
}

struct UserImageWithNameView_Previews: PreviewProvider {
    static var previews: some View {
        UserImageWithNameView(user: User.MOCK_USERS[0])
    }
}
