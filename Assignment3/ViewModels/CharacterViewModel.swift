//
//  CharacterViewModel.swift
//  Assignment3
//
//  Created by Blaire Grant on 3/31/24.
//

import Foundation

class CharacterViewModel : ObservableObject {
    
    @Published private(set) var characterData = [CharacterModel]()
    @Published var hasError = false
    @Published var error : CharacterModelError?
    private let url = "https://api.disneyapi.dev/character"
    
    @MainActor
    func fetchData() async {
        if let url = URL(string: url) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let results = try JSONDecoder().decode(CharacterResults?.self, from: data) else {
                    self.hasError.toggle()
                    self.error = CharacterModelError.decodeError
                    return
                }
                self.characterData = results.data
            } catch {
                self.hasError.toggle()
                print(error)
                self.error = CharacterModelError.customError(error: error)
            }
        }
    }
    
}

extension CharacterViewModel {
    enum CharacterModelError : LocalizedError {
        case decodeError
        case customError(error: Error)
        
        var errorDescription: String? {
            switch self {
            case .decodeError:
                return "Decoding Error"
            case .customError(let error):
                print(error)
                return error.localizedDescription
            }
        }
        
    }

}
