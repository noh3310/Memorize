//
//  MemoryGame.swift
//  Memorize
//
//  Created by 노건호 on 2021/09/04.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfcards * 2 cards to cards array
        for pairIdx in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIdx)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatching: Bool = false
        var content: CardContent
    }
}
