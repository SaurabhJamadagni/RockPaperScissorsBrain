# RockPaperScissorsBrain!

This is a challenge Project for [day 25](https://www.hackingwithswift.com/100/swiftui/25) of 100DaysOfSwiftUI by @twostraws.

## Challenge Statement

- The challenge requires a brain teasing game based on the rules of the game of Rock paper scissors.
- The game will choose from rock, paper, scissors and also will choose if the player wins or loses.
- The player then has to make the choice accordingly.
- Example, if the game chooses Rock and Win then the player must choose paper to get the correct answer.
- The game goes on for 10 rounds while keeping track of a score.

## Structure of the app

- The app has a Image view that shows the option chosen by the game followed by a text view that shows if the user wins or loses in a VStack.
- Below that is an HStack that houses three Buttons for each option respectively using a ForEach.
- Pressing a function calls a function to check if the answer is correct.
- The next function call puts forward the next round.
- A rounds variable keeps track of the number of rounds and an alert is shown at the end displaying the score and the button to restart.

## Learnings

- This app was a nice practice for concepts of layout.
- I got to practice using custom modifiers in this project that allow to simplify the main view and increase readability.
- Played around with functions and alerts.

I enjoyed the project. Although I did get stuck up in getting the UI down first instead of adding functionality. Later, I figured what was a priority and tried to get the functionality down first.
A mistake to learn from for the next project.

[Link to my 100DaysOfSwiftUI repo](https://github.com/SaurabhJamadagni/100DaysOfSwiftUI)

Thanks for reading! Let's connect on [Twitter](https://twitter.com/Saura6hJ) 👋
