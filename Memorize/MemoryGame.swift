//
//  MemoryGame.swift
//  Memorize
//
//  Created by 노건호 on 2021/09/04.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
        print("\(cards)")
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfcards * 2 cards to cards array
        for pairIdx in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIdx)
            cards.append(Card(content: content, id: pairIdx * 2))
            cards.append(Card(content: content, id: pairIdx * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatching: Bool = false
        var content: CardContent
        var id: Int
    }
}
