//
//  MoreView.swift
//  DiceRoller
//
//  Created by Gamıd Khalıdov on 09.07.2024.
//

import SwiftUI

struct MoreView: View {
    
    @Binding var range: Double
    
    let dices: [Dice]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("choose number of sides") {
    
                    HStack {
                        Text("\(String(format: "%.0f", range))")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Slider(value: $range, in: 2...99)
                            .tint(.pinky)
                        
                            
                    }
                }
                Section("history of rolls"){
                    List {
                        ForEach(dices, id: \.id) { dice in
                            HStack{
                                
                                Image(.dice)
                                    .shadow(color: .pinky ,radius: 10)
                                    .padding(.trailing, 7)

                                Text("\(dice.num)")
                                    .fontWeight(.black)
                                    .font(.title) +
                                Text("/")
                                    .fontWeight(.black)
                                    .foregroundStyle(Color.pinky)
                                    .font(.title) +
                                Text("\(dice.range)")
                                    .fontWeight(.black)
                                    .font(.title)
                                Spacer()
                                Text("\(dice.date)")
                                    .fontWeight(.medium)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                
                
            }
        }
    }
}

#Preview {
    MoreView(range: .constant(10), dices: [Dice(num: 10, range: 20)])
}
