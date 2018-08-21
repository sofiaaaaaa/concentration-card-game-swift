//
//  Card.swift
//  Concentration
//
//  Created by 임지후 on 2018. 8. 17..
//  Copyright © 2018년 임지후. All rights reserved.
//  It's a model
//  struct and class almost same.
//  1. struct no own hair
//  2. struct's value type is class's reference type.

import Foundation

struct Card: Hashable
{
    var hashValue: Int {return identifier}
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
//    init(identifier: Int){
//        self.identifier = identifier
//    }
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return Card.identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
