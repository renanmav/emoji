//
//  ContentView.swift
//  emoji
//
//  Created by Renan Machado on 25/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("emoji", store: UserDefaults(suiteName: "group.com.renanmav.emoji"))
    var emojiData: Data = Data()
    
    let emojis = [
        Emoji(icon: "😁", name: "Happy", description: "Happy face yay"),
        Emoji(icon: "🎲", name: "Dice", description: "They made Battlefield"),
        Emoji(icon: "🥳", name: "Party", description: "Lets celebrate")
    ]
    
    var body: some View {
        VStack(spacing: 30) {
            ForEach(emojis) { emoji in
                EmojiView(emoji: emoji)
                    .onTapGesture {
                        save(emoji)
                    }
            }
        }
    }
    
    func save(_ emoji: Emoji) {
        guard let emojiData = try? JSONEncoder().encode(emoji) else { return }
        self.emojiData = emojiData
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
