//
//  SelectedEmojiWidget.swift
//  SelectedEmojiWidget
//
//  Created by Renan Machado on 26/09/20.
//

import WidgetKit
import SwiftUI
import Intents

let emojiPlaceholder = Emoji(icon: "😶", name: "N/A", description: "N/A")

struct EmojiEntry: TimelineEntry {
    let date = Date()
    let emoji: Emoji
}

struct Provider: TimelineProvider {
    @AppStorage("emoji", store: UserDefaults(suiteName: "group.com.renanmav.emoji"))
    var emojiData: Data = Data()
    
    func placeholder(in context: Context) -> EmojiEntry {
        EmojiEntry(emoji: emojiPlaceholder)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (EmojiEntry) -> Void) {
        guard let emoji = try? JSONDecoder().decode(Emoji.self, from: emojiData) else { return }
        let entry = EmojiEntry(emoji: emoji)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<EmojiEntry>) -> Void) {
        guard let emoji = try? JSONDecoder().decode(Emoji.self, from: emojiData) else { return }
        let entry = EmojiEntry(emoji: emoji)
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}

struct SelectedEmojiWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        EmojiView(emoji: entry.emoji)
    }
}

@main
struct SelectedEmojiWidget: Widget {
    let kind = "SelectedEmojiWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: Provider()
        ) { entry in
            SelectedEmojiWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall])
    }
}

struct SelectedEmojiWidget_Previews: PreviewProvider {
    static var previews: some View {
        SelectedEmojiWidgetEntryView(
            entry: EmojiEntry(emoji: emojiPlaceholder)
        )
        .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
