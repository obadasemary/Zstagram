//
//  CaptionView.swift
//  Zstagram
//
//  Created by Abdelrahman Mohamed on 27.07.2023.
//

import SwiftUI

struct CaptionView: View {
    
    let name: String
    let caption: String
    
    var body: some View {
        HStack {
            Text("\(name) ")
                .fontWeight(.semibold) +
            Text(caption)
        }
        .font(.footnote)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 10)
        .padding(.top, 1)
    }
}

struct CaptionView_Previews: PreviewProvider {
    static var previews: some View {
        CaptionView(
            name: "obada",
            caption: "What type of acquisitions/investments to grow with #PlayStation Studios do you hope to see in the future?😎"
        )
    }
}
