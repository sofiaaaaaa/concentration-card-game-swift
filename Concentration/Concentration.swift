//
//  Concentration.swift
//  Concentration
//
//  Created by 임지후 on 2018. 8. 17..
//  Copyright © 2018년 임지후. All rights reserved.
// It's a model

import Foundation

struct Concentration
{
    private(set) var cards =  [Card]()
    
    //var indexOfOneAndOnlyFaceUpCard : Int?
    
    //computed property
    private var indexOfOneAndOnlyFaceUpCard : Int? {
        get {
            
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
            
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        set{//set(newValue){
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    
    mutating func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                //indexOfOneAndOnlyFaceUpCard = nil
                
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards > 0, "Concentration.init(at: \(numberOfPairsOfCards)): you must have at least one pair of cards")

        // 0...numberOfPairsOfCards  means 0 to numberOfPairsOfCards include this one
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        //TODO: Shuffle the cards
        
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
