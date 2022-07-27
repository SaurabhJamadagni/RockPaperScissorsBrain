//
//  ContentView.swift
//  RockPaperScissorBrain
//
//  Created by Saurabh Jamadagnion 21/07/22.
//

import SwiftUI

struct ItemStyle: ViewModifier {
    var width: CGFloat
    var height: CGFloat
    
    init() {
        self.width = 75
        self.height = 75
    }
    
    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .frame(width: width, height: height)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(radius: 5)
    }
}

struct HeadingStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2.weight(.semibold))
    }
}

extension View {
    func stylizeGameButton() -> some View {
        modifier(ItemStyle())
    }
    
    func stylizeGameButton(width: CGFloat, height: CGFloat) -> some View {
        modifier(ItemStyle(width: width, height: height))
    }
    
    func aboveButtonHeading() -> some View {
        modifier(HeadingStyle())
    }
}

struct ContentView: View {
    @State private var score = 0
    @State private var rounds = 1
    @State private var gameChoice = 2
    @State private var userWins = Bool.random()
    
    @State private var gameOverAlert = false
    
    let actions = ["Rock", "Paper", "Scissor"]
    let tempImageArray = ["circle.fill", "newspaper", "scissors"]
    
    var winningColor: Color {
        return Color(red: 255, green: 143, blue: 177)
    }
    
    var losingColor: Color {
        return Color(red: 122, green: 68, blue: 149)
    }
    
    var body: some View {
        ZStack {
            Color(red: 252/255, green: 226/255, blue: 162/255)
                .ignoresSafeArea()
            VStack {
                // holds the restart and score row
                HStack {
                    Button {
                        restartGame()
                    } label: {
                        Image(systemName: "gobackward")
                        Text("Restart")
                    }
                    .foregroundColor(.black)
                    
                    Spacer()
                    
                    Text("Score: \(score)")
                }
                .font(.headline)
                .padding()
                
                Spacer()
                Spacer()
                
                VStack {
                    Text("Games's choice")
                        .aboveButtonHeading()
                    Image(systemName: tempImageArray[gameChoice])
                        .font(.system(size: 75))
                        .stylizeGameButton(width: 150, height: 150)
                }
                
                Spacer()
                
                VStack {
                    Text("To")
                        .font(.title2)
                    Text(userWins ? "WIN!" : "LOSE!")
                        .font(.largeTitle.weight(.bold))
                        .foregroundColor(userWins ? .green : .red)
                        .frame(maxWidth: .infinity, maxHeight: 100)
                        .background(.ultraThinMaterial)
                }
                
                Spacer()
                
                VStack {
                    Text("Make your choice")
                        .aboveButtonHeading()
                    HStack {
                        Spacer()
                        ForEach(0..<3) { number in
                            Button {
                                if isCorrect(userChoice: number) {
                                    score += 1
                                }
                                if rounds < 10 {
                                    nextQuestion()
                                } else {
                                    gameOverAlert = true
                                }
                            } label: {
                                Image(systemName: tempImageArray[number])
                            }
                            .font(.largeTitle)
                            .stylizeGameButton()
                            
                            Spacer()
                        }
                    }
                }
                
                Spacer()
            }
        }
        .alert("Game Over!", isPresented: $gameOverAlert) {
            Button("Restart", action: restartGame)
        } message: {
            Text("Your Score is \(score)")
        }
    }
    
    func isCorrect(userChoice: Int) -> Bool {
        // If game chooses the user to loose
        if !userWins {
            // the array is such an order that the next choice beats the first
            return userChoice == (gameChoice + 1) % 3
        }
        // This check is if the user is supposed to win
        // we skip ahead by 5 to circle back in reverse without going to a negative index.
        return userChoice == (gameChoice + 5) % 3
    }
    
    func nextQuestion() {
        rounds += 1
        userWins.toggle()
        gameChoice = Int.random(in: 0...2)
    }
    
    func restartGame() {
        score = 0
        rounds = 0
        userWins = Bool.random()
        gameChoice = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
