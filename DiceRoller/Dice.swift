//
//  Dice.swift
//  DiceRoller
//
//  Created by Gamıd Khalıdov on 09.07.2024.
//

import Foundation

struct Dice: Identifiable, Codable {
    var id = UUID()
    let date: String
    let num: Int
    let range: Int
    
    init(id: UUID = UUID(), num: Int, range: Int) {
        self.id = id
        self.date = Date().formatted(Date.FormatStyle().year().month().day().hour().minute())
        self.num = num
        self.range = range
    }
}
