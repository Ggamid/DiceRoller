//
//  ContentView.swift
//  DiceRoller
//
//  Created by Gamıd Khalıdov on 09.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var num: Int = 6
    @State private var rotationAngle = 0.0
    @State private var range: Double = 6
    @State private var rotatationTime = 0.0
    @State private var scaleEffectValue = 1.0
    @State private var isBtnDisabled = false
    private var viewModel = ViewModel()
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack{
            VStack {
                ZStack{
                    Ellipse()
                        .fill(Color.pinky)
                        .blur(radius: 20)
                        .frame(width: 700, height: 400)
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(width: 200, height: 200)
                            .shadow(radius: 40)
                        
                        Text("\(num)")
                            .fontWeight(.black)
                            .font(.system(size: 120))
                            
                    }
                    .rotation3DEffect(
                        Angle(degrees: rotationAngle),
                        axis: (x: 1.0, y: 0.0, z: 0.0)
                    )
                    .scaleEffect(scaleEffectValue)
                }
                
                Button {
                    isBtnDisabled = true
                    rotatationTime = 4
                    self.timer = Timer.publish(every: 0.2, on: .current, in: .common).autoconnect()
                    withAnimation {
                        scaleEffectValue = 1
                    }
                    
                } label: {
                    Text("roll!")
                        .frame(width: 280,height: 65)
                        .background(Color.pinky)
                        .foregroundStyle(.white)
                        .clipShape(.rect(cornerRadius: 30))
                        .font(.system(size: 50))
                        .fontWeight(.black)
                    
                    
                }
                .buttonStyle(ScaleButtonStyle())
                .disabled(isBtnDisabled)
            }
            .navigationTitle("Dice Roller 🎲")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        MoreView(range: $range, dices: viewModel.dices)
                    }label: {
                        Image(systemName: "ellipsis")
                            .font(.system(size: 30))
                            .foregroundStyle(Color.pinky)
                    }
                }
            }
        }
        .onReceive(timer, perform: { _ in
            if rotatationTime > 0 {
                withAnimation {
                    rotationAngle += 180
                    num = 1000
                    rotationAngle += 180
                    num = Int.random(in: 0...Int(range))
                }
                rotatationTime -= 1
            } else {
                print("\(String(describing: num))")
                timer.upstream.connect().cancel()
                withAnimation {
                    scaleEffectValue+=0.4
                }
                isBtnDisabled = false
                viewModel.addDice(dice: Dice(num: num, range: Int(range)))
            }
        })
    }
}

#Preview {
    ContentView()
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
    }
}


extension Color {
    public static var pinky: Color {
        return Color(red: 0.9987094998, green: 0.230635345, blue: 0.7844696045)
    }
}
