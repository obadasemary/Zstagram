//
//  UserImageView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 27.07.2023.
//

import SwiftUI

struct UserImageView: View {
    
    let user: User
    
    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .xSmall)
            
            Text(user.username)
                .font(.footnote)
                .fontWeight(.semibold)
            
            Spacer()
        }
        .padding(.leading, 8)
    }
}

struct UserImageView_Previews: PreviewProvider {
    static var previews: some View {
        UserImageView(user: User.MOCK_USERS[0])
    }
}
