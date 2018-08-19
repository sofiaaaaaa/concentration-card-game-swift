//
//  ViewController.swift
//  Concentration
//
//  Created by 임지후 on 2018. 8. 17..
//  Copyright © 2018년 임지후. All rights reserved.
//
//  Reference :  Xcode9 and Swift4 Lectures [https://youtu.be/71pyOB4TPRE]

import UIKit

class ViewController: UIViewController {
    
   // lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    private lazy var game: Concentration = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count+1) / 2
    }
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
            
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    
    //Card Array
    @IBOutlet private var cardButtons: [UIButton]!
    
    
    @IBAction private func touchCard(_ sender: UIButton) {
        
        flipCount += 1
        
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            
            updateViewFromModel()
            
            //flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            // print("cardNumber = \(cardNumber)")
        } else {
            print("chosen card was not in cardButtons")
        }
        
    }
    
    private func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    private var emojiChoices = ["🦇", "🦄", "🎃", "🍜", "🐕", "👻", "🍎"]
    
    //make a empty Dictionary
    //var emoji =  Dictionary<Int,String>()
    private var emoji =  [Int:String]()
    
    private func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil, emojiChoices.count > 0  {
            //let randomIndex = arc4random_uniform(emojiChoices.count) //Cannot convert value of type 'Int' to expected argument type 'UInt32'
            //let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            //emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
            
            
        }
        
        //        let chosenEmoji = emoji[card.identifier] => optional , not set
        //        if emoji[card.identifier] != nil {
        //            return emoji[card.identifier]!
        //        } else {
        //            return "?"
        //        }
        
        //"??" doing nil check
        return emoji[card.identifier] ?? "?"
        
    }
    
    
    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
