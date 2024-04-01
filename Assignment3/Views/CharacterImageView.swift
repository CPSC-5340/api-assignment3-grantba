//
//  CharacterImageView.swift
//  Assignment3
//
//  Created by Blaire Grant on 3/31/24.
//

import SwiftUI

struct CharacterImageView: View {
    
    var url : String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
                .scaledToFit()
                .cornerRadius(20)
                .frame(width: 300, height: 300)
        } placeholder: {
            ProgressView()
        }
        
    }
}

struct CharacterImageiew_Previews: PreviewProvider {
    static var previews: some View {
        CharacterImageView(url: "")
    }
}
