//
//  Emoji.swift
//  emoji
//
//  Created by Renan Machado on 25/09/20.
//

import Foundation

struct Emoji: Identifiable, Codable {
    let icon: String
    let name: String
    let description: String
    
    var id: String { icon }
}
