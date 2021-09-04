//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 노건호 on 2021/09/04.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["🚗", "🚕", "🚓", "🚑", "🚙", "🚌", "🚎", "🏎", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🛵", "🏍", "🛺", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠", "🚟"]
    
    static func createMemoryModel() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryModel()
        
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
