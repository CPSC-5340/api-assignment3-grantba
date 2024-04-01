//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct CharacterView: View {
    
    @ObservedObject var charactervm = CharacterViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(charactervm.characterData) { character in
                    NavigationLink {
                        CharacterDetail(character: character)
                    } label: {
                        Text(character.name)
                    }
                }
            }
            .task {
                await charactervm.fetchData()
            }
            .listStyle(.grouped)
            .navigationTitle("Disney Characters")
            .alert(isPresented: $charactervm.hasError, error: charactervm.error) {
                Text("")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}
