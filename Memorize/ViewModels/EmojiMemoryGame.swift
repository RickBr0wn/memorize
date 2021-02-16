//
//  MemoryGameViewModel.swift
//  Memorize
//
//  Created by Rick Brown on 15/12/2020.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
  @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
  
  static func createMemoryGame() -> MemoryGame<String> {
    let emojis: Array<String> = ["👻", "🎃", "💀"]
    
    return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
      return emojis[pairIndex]
    }
  }
  
  // MARK: - Access to the model.
  var cards: Array<MemoryGame<String>.Card> {
    model.cards
  }
  
  // MARK: - Actions.
  func choose(card: MemoryGame<String>.Card) {
    model.choose(card: card)
  }
}
