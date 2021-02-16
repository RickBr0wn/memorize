//
//  MemoryGameModel.swift
//  Memorize
//
//  Created by Rick Brown on 15/12/2020.
//

import Foundation

struct MemoryGame<CardContent> {
  var cards: Array<Card>
  
  mutating func choose(card: Card) -> Void {
    let chosenIndex = self.index(of: card)
    cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
  }
  
  func index(of card: Card) -> Int {
    for index in 0..<self.cards.count {
      if self.cards[index].id == card.id {
        return index
      }
    }
    // TODO: Needs repair
    return -1
  }
  
  init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
    cards = Array<Card>()
    
    for pairIndex in 0..<numberOfPairsOfCards {
      let content = cardContentFactory(pairIndex)
      
      cards.append(Card(content: content, id: pairIndex * 2))
      cards.append(Card(content: content, id: pairIndex * 2 + 1))
    }
    
    cards.shuffle()
  }
  
  struct Card: Identifiable {
    var isFaceUp: Bool = true
    var isMatched: Bool = false
    var content: CardContent
    var id: Int
  }
}
