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
}
