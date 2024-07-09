//
//  ContentView-ViewModel.swift
//  DiceRoller
//
//  Created by Gamıd Khalıdov on 09.07.2024.
//

import Foundation

extension ContentView {
    class ViewModel {
        private(set) var dices: [Dice]
        let savePath = URL.documentsDirectory.appending(path: "SavedDices")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                self.dices = try JSONDecoder().decode([Dice].self, from: data)
            } catch {
                self.dices = []
                print(error)
            }
        }
        
        // save func
        func save() {
            do {
                let data = try JSONEncoder().encode(dices)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print(error)
            }
        }
        
        // delete func
        func deleteDice(dice: Dice) {
            dices.append(dice)
            save()
        }
        
        // add func
        func addDice(dice: Dice) {
            dices.append(dice)
            save()
        }
        
    }
}
