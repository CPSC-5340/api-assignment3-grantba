//
//  CharacterDetail.swift
//  Assignment3
//
//  Created by Blaire Grant on 3/31/24.
//

import SwiftUI

struct CharacterDetail: View {
    
    var character : CharacterModel

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                Text(character.name)
                    .bold()
                    .underline()
                    .font(.system(size: 30))
                    .padding(.horizontal)
                //Text("Films: " + (character.films?[0] ?? ""))
                Link("More Character Information",
                     destination: URL(string: character.sourceUrl)!)
                .font(.system(size: 20))
                .padding(.horizontal)
                CharacterImageView(url: character.imageUrl ?? "")
            }
        }
    }
}
