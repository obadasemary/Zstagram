//
//  UserImageWithNameView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 28.07.2023.
//

import SwiftUI

struct UserImageWithNameView: View {
    
    let image: String
    let name: String
    let title: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(name)
                    .fontWeight(.semibold)
                
                Text(title)
            }
            .font(.footnote)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct UserImageWithNameView_Previews: PreviewProvider {
    static var previews: some View {
        UserImageWithNameView(
            image: "Obada",
            name: "Obada",
            title: "Senior iOS Developer"
        )
    }
}
