//
//  Student.swift
//  demo
//
//  Created by Student on 7/27/25.
//



//DEMO DAY 2
import Foundation

struct MoodEntry: Identifiable, Codable {
    let id: UUID
    var date: Date
    var mood: String

    init(id: UUID = UUID(), date: Date, mood: String) {
        self.id = id
        self.date = date
        self.mood = mood
    }
}


struct Student: Identifiable, Codable {
    let id: UUID
    var name: String
    var emoji: String
    var entries: [MoodEntry]
    
    init(id: UUID = UUID(), name: String, emoji: String, entries: [MoodEntry] = []) {
        self.id = id
        self.name = name
        self.emoji = emoji
        self.entries = entries
    }
}

    
    
