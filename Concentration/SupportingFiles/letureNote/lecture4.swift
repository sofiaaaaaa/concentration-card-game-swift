//
//  lecture4.swift
//  Concentration
//
//  Created by 임지후 on 2018. 8. 20..
//  Copyright © 2018년 임지후. All rights reserved.
//

/*
 
 Protocol & extension

Using extension to provide protocol implementation
We said that protocol implementation is provided by implementing types(Struct, enum, class)
However, an extension can be used to add default implementation to a protocol.
Since there's no storage, said implementation has to be in terms of other API in the protocol (and any API in any protocol that that protocol inherits from, of course).
 
 for example, for the Sequence protocol, you really only need to implement makeIterator.
 (An iterator implements the IteratorProtocol which just has the method next().)
 If you do, you will automatically get implementations for all these other methods in Sequence:
 
 contains(), forEach(), joined(separator:), min() max(), even filter() and map(), et. al.
 All of these are implemented via an extension to the Sequence protocol.
 
 This extension (provided by Apple) uses only Sequence protocol mothods in its implementation.
 
 extension Sequence {
 func contains(_ element: Element) -> Bool {}
 // etc.
 }

 Advanced use of Protocols
 
 Functional Programming
 By combining protocols with generics and extensions (default implementations),
 you can build code that focusses more on the behavior of data structures than storage.
 This approach to development is called "functional programming"
 It is different than "object-oriented programming" (it's sort of an evolution thereof).
 We don't have time to teach functional programming, but you are getting a taste of it.
 What's great about Swift is that it supports buoth paradigms.
 
 String
 The characters in a String
 A String is made up of Unicodes, but there's also the concept of a Character.
 A Character is what a human would perceive to be a single lexical character.
 This is true even if a single Character is made up of multiple Unicodes.
 
 Note the ..< above.
 This is a Range of String.Index.
 Range is a generic type (like Array is). It doesn't have to be a range of Ints.
 
 Another way to find the second word: pizzaJoint.components(separatedBy: " ")[1]
 components(separatedBy:) returns an Array<String> (might be empty, though, so careful!)
 
 The characters in a String
 
 String is also a Collection (in the same sense that an Array is a Collection) of Characters
 All the indexing stuff(index(of:), etc.) is part of Collecttion.
 A Collection is also a Sequence, so you can do things like ...
 
 for c in s { }  // iterate through all Characters in s
 let characterArray = Array(s) // Array<Character>
 (Array has an init that takes any Sequence as an argument.)
 
 A String is a value type (it's a struct)
 
 We usually work with immutable Strings (i.e. let s = ...).
 But there are mutating methods on String as well, for example ...
 var s = pizzaJoint // makes a mutable copy of pizzaJoint (becuase it's a value type!)
 s.insert(contentsOf: " foo", at: s.index(of: " ")!) // cafe foo pesto
 The type of contentsOf: argument is any Collection of Character (which string is).
 
 func replaceSubrange(Range<String.Index>, with: Collection of Character)
 e.g., s.replaceSubrange(..<s.endIndex, with: "new contents")
 Note the ..< Rnage appears to have no star! It defaults to the start of the String.
 
 And much, much more. Check out the documentation.
 
 NSAttributedString
 
 A String with attributes attached to each character
 Conceptually, an object that pairs a String and a Dictionary of attributes for each Character.
 The Dictionary's keys are things like "the font" or "the color", etc.
 The Dictionary's values depend on what the key is (UIFont or UIColor or whatever).
 Many times (almost always), large range of Characters have the same Dictionary.
 Often (like in your homework), the entire NSAttributedString uses the same Dictionary.
 You can put NSAttributedStrings on UILabels, UIButtons, etc.
 
 Creating and using an NSAttributedString
 
 Here's how we'd make the flip count label have orange, outlined text ...
 let attributes : [NSAttributedStringKey : Any ] = [ //note: type cannot be inferred here
     .strokeColor : UIColor.orange,
     .strokeWidth : 5.0 // negative number here would mean fill (positive means outline)
]
 let attribtext = NSAttributedString(string: "Flips: 0", attributes: attributes)
 flipCountLabel.attributedText = attribtext // UIButton has attributedTitle
 
 ## Closures
 
 Where do we use closures?
 Array has a method called map which takes a function as an argument.
 It applies that function to each element of the Array to create and return a new Array.
 
 let primes = [2.0, 3.0, 5.0 7.0, 11.0]
 let negativePrimes = primes.map({ -$0 })
 let invertedPrimes = primes.map() { 1.0/$0 }
 let primeStrings = primes.map { String($0) }
 
 Note that if the last (or only) argument to a method is a closure, you can put it outside the method's parentheses that contain its arguments
 and if the closure was the only argument, you can skip the () completely if you want.
 
 *  Closures with property initialization
 
 You can also execute a closure to do initialization of a property if you want...
 var someProperty: Type = {
    //construct the value of someProperty here
    return <the constructed value>
 }()
 
 This is especially useful with `lazy` property initialization.
 
 * Capturing
 
 Closures are regular types, so they can be put in Arrays, Dictionarys, etc.
 When this happens, they are stored in the heap (i.e. they are reference type)
 
 What is more, they "capture" variable they use from the surrounding code into the heap too. Those captured variables need to stay in the heap as long as the closure stays in the heap.
 

 var ltuae = 42
 operation = { letuae * $0 } // "captures" the ltuae var because it's needed for this closure
 arrayOfOperations.append(operation)
 //if we later change ltuae, then then next time we evaluate operation it will reflect that
 //even if we leave the scope (function or whatever) that this code is in!
 
 This can create a memory cycle though.
 We'll see this later in the quarter and how to avoid that.
 
 */

