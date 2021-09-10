//
//  MemoryGame.swift
//  Memorize
//
//  Created by 노건호 on 2021/09/04.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
                            !cards[chosenIndex].isFaceUp,
                            !cards[chosenIndex].isMatching
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatching = true
                    cards[potentialMatchIndex].isMatching = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("\(cards)")
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
        var isFaceUp: Bool = false
        var isMatching: Bool = false
        var content: CardContent
        var id: Int
    }
}
