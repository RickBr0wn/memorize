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
    HStack {
      ForEach(viewModel.cards) { card in
        CardView(card: card)
          .onTapGesture(perform: { viewModel.choose(card: card) })
          .aspectRatio(2/3, contentMode: .fit)
      }
    }
    .padding()
    .foregroundColor(Color.orange)
    .font(Font.largeTitle)
  }
}

enum General: CGFloat {
  case cornerRadius = 10.0
}

struct CardView: View {
  var card: MemoryGame<String>.Card
  
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        if card.isFaceUp {
          RoundedRectangle(cornerRadius: General.cornerRadius.rawValue).fill(Color.white)
          RoundedRectangle(cornerRadius: General.cornerRadius.rawValue).stroke(lineWidth: 3.0)
          Text(card.content)
        } else {
          RoundedRectangle(cornerRadius: General.cornerRadius.rawValue).fill()
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
  }
}
