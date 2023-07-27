//
//  UserImageView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 27.07.2023.
//

import SwiftUI

struct UserImageView: View {
    
    let image: String
    let name: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text(name)
                .font(.footnote)
                .fontWeight(.semibold)
            
            Spacer()
        }
        .padding(.leading, 8)
    }
}

struct UserImageView_Previews: PreviewProvider {
    static var previews: some View {
        UserImageView(
            image: "Obada",
            name: "Abdelrahman Mohamed"
        )
    }
}
