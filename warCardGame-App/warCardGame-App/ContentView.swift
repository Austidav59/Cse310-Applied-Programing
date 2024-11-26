//
//  ContentView.swift
//  warCardGame-App
//
//  Created by Austin Davis on 11/8/24.
//

import SwiftUI

struct ContentView: View {
    @State private var playerCard = "card7"
    @State private var cpuCard = "card13"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    @State private var gameOver = false
    @State private var winner = ""
    
    var body: some View {
        ZStack {
            // Background color
            Color(red: 0.0, green: 0.5, blue: 0.0)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                // Game logo
                Image("logo")
                    .resizable()
                    .frame(width: 200, height: 100)
                Spacer()
                
                // Cards
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                // Deal button
                Button(action: deal) {
                    Image("dealbutton")
                        .resizable()
                        .frame(width: 200, height: 100)
                }
                .disabled(gameOver) // Disable button when game is over
                .opacity(gameOver ? 0.5 : 1.0)
                
                Spacer()
                
                // Scores
                HStack {
                    Spacer()
                    VStack {
                        Text("Player 1")
                            .font(.largeTitle)
                        Text(String(playerScore))
                            .font(.title)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.largeTitle)
                        Text(String(cpuScore))
                            .font(.title)
                    }
                    Spacer()
                }
                Spacer()
                
                // Winner Message
                if gameOver {
                    Text(winner)
                        .font(.largeTitle)
                        .foregroundColor(.yellow)
                        .padding()
                }
            }
        }
    }
    
    func deal() {
        // Generate random card values
        let playerCardValue = Int.random(in: 2...14)
        let cpuCardValue = Int.random(in: 2...14)
        
        // Update card images
        playerCard = "card\(playerCardValue)"
        cpuCard = "card\(cpuCardValue)"
        
        // Compare values and update scores
        if playerCardValue > cpuCardValue {
            playerScore += 1
        } else if cpuCardValue > playerCardValue {
            cpuScore += 1
        }
        
        // Check for game over
        if playerScore >= 20 {
            gameOver = true
            winner = "Player 1 Wins!"
        } else if cpuScore >= 20 {
            gameOver = true
            winner = "CPU Wins!"
        }
    }
}

#Preview {
    ContentView()
}
