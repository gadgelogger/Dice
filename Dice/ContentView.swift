//
//  ContentView.swift
//  Dice
//
//  Created by gadgelogger on 2023/09/10.
//
//
import SwiftUI

struct ContentView: View {
    @State private var randomNumber = 1
    @State private var timer: Timer?
    @State private var isRolling = false
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "die.face.\(randomNumber)")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width/2)
                .padding()
            Spacer()
            Button("サイコロを振る"){
                playDice()
            }
            .padding()
            .background(.orange)
            .foregroundColor(.black)
            .cornerRadius(10)
            .disabled(isRolling)
            Spacer()
            
        }
        .padding()
    }
    private func playDice(){
        print("ボタンが押されたで")
        isRolling = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            randomNumber = Int.random(in: 1...6)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            timer?.invalidate()
            timer = nil
            isRolling = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
