//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Rick Brown on 15/12/2020.
//

import SwiftUI

@main
struct MemorizeApp: App {
  var game = EmojiMemoryGame()
  
  var body: some Scene {
    WindowGroup {
      EmojiMemoryGameView(viewModel: game)
    }
  }
}
