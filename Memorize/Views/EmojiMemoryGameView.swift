//
//  ContentView.swift
//  Memorize
//
//  Created by Rick Brown on 15/12/2020.
//

import SwiftUI

struct EmojiMemoryGameView: View {
  @ObservedObject var viewModel: EmojiMemoryGame
  
  var body: some View {
    Grid(viewModel.cards) { card in
        CardView(card: card)
          .onTapGesture { viewModel.choose(card: card) }
          .aspectRatio(2/3, contentMode: .fit)
          .padding(5)
    }
    .padding()
    .foregroundColor(Color.orange)
    .font(Font.largeTitle)
  }
}

struct CardView: View {
  var card: MemoryGame<String>.Card
  
  var body: some View {
    GeometryReader { geometry in
      self.body(for: geometry.size)
    }
  }
  
  func body(for size: CGSize) -> some View {
    ZStack {
      if card.isFaceUp {
        RoundedRectangle(cornerRadius: cornerRadius)
          .fill(Color.white)
        
        RoundedRectangle(cornerRadius: cornerRadius)
          .stroke(lineWidth: edgeLineWidth)
        
        Text(card.content)
      } else {
        if !card.isMatched {
          RoundedRectangle(cornerRadius: cornerRadius)
            .fill()
        }
      }
    }
    .font(Font.system(size: fontSize(for: size)))
  }
  
  // MARK: Layout Constants
  let cornerRadius: CGFloat = 10.0
  let edgeLineWidth: CGFloat = 3.0
  
  func fontSize(for size: CGSize) -> CGFloat {
    min(size.width, size.height) * 0.8
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
  }
}
