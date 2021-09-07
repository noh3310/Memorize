//
//  MemorizeApp.swift
//  Memorize
//
//  Created by 노건호 on 2021/09/04.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
