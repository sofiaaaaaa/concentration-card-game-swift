//: Playground - noun: a place where people can play
// Reference :  Xcode9 and Swift4 Lectures [https://youtu.be/71pyOB4TPRE]


import UIKit

//## Floting point CountableRange

//for(i = 0.5; i <= 15.25; i += 0.3){
//    print(i)
//}

0.5...15.25

for i in stride(from:0.5, through: 15.25, by: 0.3){
print(i)
}

/* ## Tuples
* what is a tuple?
* It is nothing more than a grouping of values. You can use it anywhere you can use a type.

*/

let k: (String, Int, Double) = ("hello", 5, 0.85) // the type of x is "a tuple"
let (word, number, value) = k // this names the tuple elements when accessing the tuple
print(word, number, value)

let y: (w: String, i: Int, v: Double) = ("hello", 5, 0.85)
print(y.w, y.i, y.v)

let (wrd, num, val) = y
print(y)

// Tuples as return value from a function or method..
func getSize() -> (weight: Double, height: Double) { return(250, 80)}

let v = getSize()
print("weight is \(v.weight)")
print("height is \(getSize().height)")

/* ## Computed Properties
* The value of a property can be computed rather than stored
*/

// A typical stored property looks something like this...
var foo: Double

// A computed property looks like this...
var foo2: Double {
get {
// return the calculated value of foo
}
set(newValue) {
// do something based on the fact that foo has changed to newValue
}
}


/* ## Access Control
* Protecting our internal implementations
* Likely most of you have only worked on relatively smalll projects
* Inside those projects, any object can pretty much call any function in any other object
* When projects start to get large, though, this becomes very dicey
* You want to be able to protect the INTERNAL implementation of data structures
* You do this by marking which API* you want other code to use with certain keywords
* i.g. methods and properties
*
*
* [Keywords]
* internal - this is the default, it means "usable by any object in my app or framework"
* private - this means "only callabel from within this object"
* private(set) - this means "this property is readable outside this object, but not settable"
* fileprivate - accessible by any code in this source file
* public - (for frameworks only) this can be used by objects outside my framework
* open - (for frameworks only) public and objects outside my framework can subclass this
*
*
* A good strategy is to just mark everything private by default.
* Then remove the private designation when that API is ready to be used by other code.
*/


/* ## Extensions
* 1. Extending existing data structures
* You can add methods/properties to a class/struct/enum (even if you don't have the source).
* 2. There are some restrictions
* You can't re-implement methods or properties that are already there (only add new ones).
* The properties you add can have no storage associated with them (computed only).
* 3. This feature is easily abused
* It should be used to add clarity to readability not obfuscation!
* Don't use it as a substitute for good object-oriented design technique.
* Best used (at least for beginners) for very small, well-contained helper functions.
* Can actually be used well to organize code but requires architectural commitment.
* When in doubt (for now), don't do it.
*/

/* ## Optional
* A completely normal type in Swift
* It's an enumeration
* Let's take a moment and learn about enumerations and then we'll look at Optionals a little closer
*
*/

/* ## enum
* Another variety of data structure in addition to struct and class
* It can only have discrete states ...
* An enum is a VALUE TYPE(like struct), so it is copied as it is passed around
*/

enum FastFoodMenuItem {
case hamburger(patties: Int)
case fries(size: FryOrderSize)
case drink(String, ounces: Int)
case cookie
}

// Note that the drink case has 2 pieces of associated data (one of them "unnamed")
// In the example above, FryOrderSize would also probably be an enum, for example...

enum FryOrderSize {
case large
case small
}

//Setting the value of an enum
//Assigning a value to a variable or constant of type enum is easy...
//Just use the name of type along with the case you want, separated by dot..

let menuItem: FastFoodMenuItem = FastFoodMenuItem.hamburger(patties: 2)
var otherItem: FastFoodMenuItem = FastFoodMenuItem.cookie

//Swift can infer the type one side of the assignment or the other (but not both) ...
let menuItem2 = FastFoodMenuItem.hamburger(patties: 2)
var otherItem2: FastFoodMenuItem = .cookie

//var yetAnotherItem = .cookie //Swift can't figure this out

//checking an enum's state
// An enum's state is checked with a switch statement...

var menuItem = FastFoodMenuItem.hamburger(patties: 2)
switch menuItem {
case FastFoodMenuItem.hamburger: print("burger")
case FastFoodMenuItem.fries: print("fries")
case FastFoodMenuItem.drink: print("drink")
case FastFoodMenuItem.cookie: print("cookie")
}

// It is not necessary to use the fully-expressed FastFoodMenuItem.fries inside the switch (since Swift can infer the FastFoodMenuItem part of that)
switch menuItem {
case .hamburger: print("burger")
case .fries: print("fries")
case .drink: print("drink")
case .cookie: print("cookie")
}

// break
// If you don't want to do anything in a given case, use `break`
switch menuItem {
case .hamburger: break
case .fries: print("fries")
case .drink: print("drink")
case .cookie: print("cookie")
}
// This code would print nothing on the console


// default
// You must handle ALL POSSIBLE CASES (although you can `default` uninteresting cases) ...
switch menuItem {
case .hamburger: break
case .fries: print("fries")
default: print("other")
}
//If the menuItem were a cookie, the above code would print "other" on the console

// Multiple lines allowed
// Each case in a switch can be multiple lines and does NOT fall through to the next case...

var menuItem2 = FastFoodMenuItem.fries(size: FryOrderSize.large)
switch menuItem {
case .hambuger: print("burger")
case .fries:
print("yummy")
print("fries")
case .drink:
print("drink")
case .cookie:  print("cookie")
}

// The above code would print "yummy" and "fries" on the console, but not "drink"

//What about the associated data?
// Associated data is accessed through a switch statement using this `let` syntax...

var menuItem3 = FastFoodMenuItem.drink("Coke", ounces: 32)
switch menuItem {
case .hamburger(let pattyCount): print("a burger with \(pattyCount) patties!")
case .fries(let size): print("a \(size) order of fries!")
case .drink(let brand, let ounces): print("a \(ounces)oz \(brand)")
case .cookie: print("a cookie")
}

// Note that the local variable that retrieves the associated data can have a different name
// e.g. pattyCount above versus patties in the enum declaration
// e.g. brand above versus not even having a name in the enum declaration

//Methods yes, (stored) Properties no
// An enum can have methods (and computed properties) but no stored properties...

enum FastFoodMenuItem {
case hamburger(numberOfPatties: Int)
case fries(size: FryOrderSize)
case drink(String, ounces: Int)
case cookie

func isIncludedInSpecialOrder(number: Int) -> Bool {}
var calories: Int { } //calculate and return caloric value here
}

// An enum's state is entirely which case it is in and that case's associated data.

// In an enum's own methods, you can test the enum's state (and get associated data) using self...

enum FastFoodMenuItem {
//...
func isIncludedInSpecialOrder(number: Int) -> Bool {
switch self {
case .hamburger(let pattyCount): return pattyCount == number
case .fries, .cookie: return true // a drink and cookie in every special order
case .drink(_, let ounces): return ounces == 16 // & 16oz drink of any kind
}
}
}
// Special order 1 is a single patty burger, 2 is a double patty ( 3 is a triple, etc.?!)

// Modifying self in an enum
// You can even reassign  `self` inside an enum method ...

enum FastFoodMenuItem {
// ...
mutating func switchToBeingACookie(){
self = .cookie // this works even if self is a .hamburger, .fries or .drink
}
}

// Note that `mutating` is required because enum is a VALUE TYPE.



/* ## Optional
* So an Optional is just an enum
* It essentially looks like this...
*
*/

enum Optional<T> { // a generic type, like Array<Element> or Dictionary<Key, Value>
case none
case some(<T>) //the some case has associated data of type T
}

// But this type is so important that it has a lot of special syntax that other types don't have...


/* ## Optional
* Special Optional syntax in Swift
* the "not set" case has a special keyword : nil
* The character ? is used to declare an Optional, e.g. var indexOfOneAndOnlyFaceUpCard: Int?
* The character ! is used to "unwrap" the associated data if an Optional is in the "set" state...
* e.g. let index = cardButtons.index(of: button)!
* The keyword `if` can also be used to conditionally get the associated data ...
* e.g. if let index = cardButtons.index(of: button) { ... }
* An Optional declared with ! (instead of ?) will implicitly unwrap (add !) when accessed ...
* e.g. var flipCountIndex: UILable! enables flipCountIndex.text = "..." (i.e. no ! here)
* You can use ?? to create an expression which "defaults" to a value if an Optional is not set ...
* e.g return emoji[card.indentifier] ?? "?"
* You can also use ? when accessing an Optional to bail out of an expression midstream ...
* this is called Optional Chaining
* we'll take a closer look at it in a few slides
*/

// Note that Optionals always start out `nil`...


var hello: String?
var hello: Optional<String> = .none

var hello: String? = "hello"
var hello: Optional<String> = .some("hello")

var hello: String? = nil
var hello: Optional<String> = .none

// Optional Unwrappring...

let hello: String? = _
print(hello!)

switch hello {
case .none: // raise an exception (crach)
case .some(let data): print(data)
}

if let greeting = hello {
print(greeting)
} else {
// do something else
}

switch hello {
case .some(let data): print(data)
case .none: {
//do something else
}
}

// Optional
// Implicitly unwrapped Optional (these start out nil too)...

enum Optional<T> {
case none
case some(<T>)
}

var hello: String!
hello = _
print(hello)

var hello: Optional<String> = .none
switch hello {
case .none : // raise exception(crash)
case .some(let data): print(data)
}

// Optional
// Nil-coalescing operator (Optional defaulting) ...
enum Optional<T> {
case none
case some(<T>)
}

let x: String? = ...
let y: x ?? "foo"

switch x {
case .none: y = "foo"
case .some(let data): y = data
}

// Optional
// Optional chaining ...

enum Optional<T> {
case none
case some(<T>)
}

let x: String? = ...
let y = x?.foo()?.bar?.z


switch x {
case .none: y = nil
case .some(let data1) :
switch data1.foo() {
case .none: y = nil
case .some(let data2):
switch data2.bar {
case .none: y = nil
case .some(let data3): y = data3.z
}
}
}

/* ## Data Structures
*  ### Four Essential Data Structure-building Concepts in Swift
* - class
* - struct
* - enum
* - protocol
*
* ### Class
* Supports object-oriented design
* Single inheritance of both functionality and data (i.e. instance variables)
* Reference type (classes are stored in the heap and are passed around via pointers)
* Heap is automatically "kept clean" by swift (via reference counting, not garbage collection)
* Examples: ViewController, UIButton, Concentration
*/

/* ## Memory Management
* ### Automatic Reference Counting
* Reference types(classes) are stored in the heap.
* How does the system know when to reclaim the memory for these from the heap?
* It "counts references" to each of them and when there are zero references, they get tossed.
* This is done automatically.
* It is known as "Automatic Reference Counting" and it is NOT garbage collection.
*/

/* ## Influencing ARC
* You can influence ARC by how you declare a reference-type var with these keywords ...
* strong
* weak
* unowned
*/

/* ### strong
* strong is "normal" reference counting
* As long as anyone, anywhere has a strong pointer to an instance, it will stay in the heap
*
* ### weak
* weak means "if no one else is interested in this, then neither am I, set me to nil in that case"
* Because it has to be nil-able, weak only applies to Optional pointers to reference types
*  A weak pointer will NEVER keep an object in the heap
*  Great exmaple : outlets (strongly held by the view hierarchy, so outlets can be weak)
*
* ### unowned
* unowned means "don't reference count this; crash if I'm wrong"
* This is very rarely used
* Usually only to break memory cycles between objects (more on that in a little while)
*/

/* ## struct
* Value type(struct don't live in the heap and are passed around by copying them)
* Very efficient "copy on write" is automatic in Swift
* This copy on write behavior requries you to mark mutating methods
* No inheritance (of data)
* Mutability controlled via let(e.g. you can't add elements to an Array assigned by let)
* Supports functional programming design
* Examples : Card, Array, Dicitionary, String, Character, Int, Double, UInt32
*/

/* ## enum
* Used for variables that have one of a discrete set of values
* Each option for that discrete value can have "associated data" with it
* The associated data is the only storage that an enum can have (no instance variables)
* Value type(i.e. passed around by copying)
* Can have methods and computed (only) properties
*/

/* ## protoccol
* A type which is a declaration of functionality only
* No data storage of any kind (so it doesn't make sense to say it's a "value" or "reference" type)
* Essentially provides multiple inheritance (of functionality only, not storage) in Swift
* We'll "ease into" learning about protocols since it's new to most of you
*/

