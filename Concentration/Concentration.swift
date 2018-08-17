//
//  Concentration.swift
//  Concentration
//
//  Created by 임지후 on 2018. 8. 17..
//  Copyright © 2018년 임지후. All rights reserved.
// It's a model

import Foundation

class Concentration
{
    var cards =  [Card]()
    
    var indexOfOneAndOnlyFaceUpCard : Int?
    
//    func chooseCard(at index: Int) {
//        if cards[index].isFaceUp {
//            cards[index].isFaceUp = false
//        } else {
//            cards[index].isFaceUp = true
//        }
//    }
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                
            } else {
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                    
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        // 0...numberOfPairsOfCards  means 0 to numberOfPairsOfCards include this one
        for _ in 1...numberOfPairsOfCards {
            //let card = Card(identifier: identifier)
            let card = Card()
            cards += [card, card]
            //cards.append(card)
            //cards.append(card)
        }
        //TODO: Shuffle the cards
        
    }
}
