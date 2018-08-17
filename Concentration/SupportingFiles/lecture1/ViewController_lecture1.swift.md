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

    /* when press option key and focus "filpCount" on mouse and "?" mark appear,
        click the variable name, It shows the type information.
 
        var flipCount = 0 => Int
        var flipCount = 0.0 => double
    */
    var flipCount = 0 {
        didSet {
             flipCountLabel.text = "Flips: \(flipCount)"
            
        }
    }
    
    // ! (exclamation mark) is very important in Swift
    //Label "Flips : 0" Instance variable
    @IBOutlet weak var flipCountLabel: UILabel!
    
    /*
       Tip
       1. if you want to rename and press command key and click that instance. Then It shows a popup menu, you can choose rename.
       2. a yellow circle button with white square inside is a View Controller in main.storyboard. dragging the button pressing control key to connect each card.
    */
    
    //Card Array
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices: Array<String> = ["🎃", "👻", "🎃", "👻"]
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        flipCount += 1
        
        /*
            1. constant use `let` not `var`
                let cardNumber = cardButtons.index(of: sender)  ==> Optional(1), Optional(0)
         
            2. code crashing in running
                Thread! : EXE_BAD_INSTRUCTION(code = EXC_1386..
                fatal error: unexpectedly found nil while unwrapping an Optional value
         */
        if let cardNumber = cardButtons.index(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
           // print("cardNumber = \(cardNumber)")
        } else {
            print("chosen card was not in cardButtons")
        }
        
        
        
        //flipCountLabel.text = "Flips: \(flipCount)"  <== move to "flipCount didSet"
        //flipCard(withEmoji: "👻", on: sender)
    }

//   "copy and paste" is awful
//    @IBAction func touchSecondCard(_ sender: UIButton) {
//        flipCount += 1
//        //flipCountLabel.text = "Flips: \(flipCount)"  <== move to "flipCount didSet"
//        flipCard(withEmoji: "🎃", on: sender)
//    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        //Debugging Command print, "\()"
        //print("flipCard(withEmoji: \(emoji))")
        
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
}

