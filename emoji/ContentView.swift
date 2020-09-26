//
//  ContentView.swift
//  emoji
//
//  Created by Renan Machado on 25/09/20.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = [
        Emoji(icon: "😁", name: "Happy", description: "Happy face yay"),
        Emoji(icon: "🎲", name: "Dice", description: "They made Battlefield"),
        Emoji(icon: "🥳", name: "Party", description: "Lets celebrate")
    ]
    
    var body: some View {
        VStack(spacing: 30) {
            ForEach(emojis) { emoji in
                EmojiView(emoji: emoji)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
