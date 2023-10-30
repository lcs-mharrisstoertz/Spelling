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
    
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            Image(currentItem.imageName)
                .resizable()
                .scaledToFit()
            
            TextField("Enter the name of the item", text: $userGuess)
                .padding(.horizontal)
            HStack{
                Spacer()
                Button(action: {
                    //could put if statement in here instead of func
                    checkGuess()
                }, label: {
                    Text("Submit")
                })
                
                Button(action: {
                    //new question
                }, label: {
                    Text("New Question")
                })
            }
            .padding()
        }
        
    }
    
    //MARK: Functions
    
    func checkGuess() {
        if userGuess == currentItem.word{
            print("Correct")
        } else {
            print("Incorrect")
        }
    }
    
}

#Preview {
    QuizView()
}
