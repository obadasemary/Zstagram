//
//  EditProfileRowView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 15.08.2023.
//

import SwiftUI

struct EditProfileRowView: View {
    
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            
            VStack(spacing: 0) {
                TextField(placeholder, text: $text)
                
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}

struct EditProfileRowView_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            EditProfileRowView(
                title: "Name",
                placeholder: "Enter your name",
                text: .constant("Obada")
            )
            EditProfileRowView(
                title: "Bio",
                placeholder: "bio",
                text: .constant("Senior iOS Developer")
            )
        }
    }
}
