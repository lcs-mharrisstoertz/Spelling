//
//  QuizView.swift
//  Spelling
//
//  Created by Russell Gordon on 2023-10-30.
//

import SwiftUI

struct QuizView: View {
    
    // MARK: Stored properties
    @State var currentItem = itemsToSpell.randomElement()!
    
    @State var userGuess = ""
    
    @State var currentOutcome: Outcome = .undetermined
    
    @State var history: [Result] = []
    
    // MARK: Computed properties
    var body: some View {
        HStack {
            VStack {
                Image(currentItem.imageName)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    TextField("Enter the name of the item", text: $userGuess)
                        .padding(.horizontal)
                    
                    Text(currentOutcome.rawValue)
                }
                .padding(.horizontal)
                
                HStack{
                    Spacer()
                    
                    Button(action: {
                        newWord()
                    }, label: {
                        Text("New Word")
                    })
                    
                    Button(action: {
                        //could put if statement in here instead of func
                        checkGuess()
                    }, label: {
                        Text("Submit")
                    })
                    
                }
                .padding()
            }
            
            List(history) { currentResult in
                HStack{
                    Image(currentResult.item.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    Text(currentResult.guessProvided)
                    
                    Spacer()
                    
                    Text(currentResult.outcome.rawValue)
                }}
        }
        
    }
    
    //MARK: Functions
    
    func newWord() {
        //add the current result to history
        //add to the start of list so it is always visible

        history.insert(
            Result(
            item: currentItem,
            guessProvided: userGuess,
            outcome: currentOutcome
        ),
                       at: 0
        )
        
        //DEBUG: What is the history list?
        print(history)
        
        //reset quiz page (make all properties go back to original values
        currentItem = itemsToSpell.randomElement()!
        userGuess = " "
        currentOutcome = .undetermined
    }
    
    func checkGuess() {
        if userGuess == currentItem.word{
            print("Correct")
            currentOutcome = .correct
        } else {
            print("Incorrect")
            currentOutcome = .incorrect
        }
    }
    
}

#Preview {
    QuizView()
}
