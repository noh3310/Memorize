//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 노건호 on 2021/09/04.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🚗", "🚕", "🚓", "🚑", "🚙", "🚌", "🚎", "🏎", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🛵", "🏍", "🛺", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠", "🚟"]
    
    static func createMemoryModel() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 3) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryModel()
        
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card)
    }
}
