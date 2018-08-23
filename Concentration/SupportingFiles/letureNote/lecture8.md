#  lecture8 : Animation

---

Source :  https://youtu.be/84ZhYhAwYqo

---

## Changes to certain UIView properties can be animated over time

frame/center
bounds (transient size, does not conflict with animating center)
transform (translation, rotation and scale)
alpha (opacity)
backgroundColor

## Done with UIViewPropertyAnimator using closures

You define some animation prarameters and pass an animation block (i.e. closure).
The animation block contains the code that makes the changes to the UIView(s).
The animation block will only animate changes to the above-mentioned UIView properties.
The changes inside the block are made immediately (even though they will appear "over time").
Most also have another "completion block" to be executed when the animation is done.


## Easiest way to use a UIViewPropertyAnimator

```
class func runningPropertyAnimator(
    withduration: TimeInterval,
    delay: TimeInterval,
    options: UIViewAnimationOptions,
    animations: () -> Void, 
    completion: ((position: UIViewAnimatingPosition) -> Void)? = nil
)
```

Note that this is a static (class) function. You send it to the UIViewPropertyAnimator type.
The animations argument is a closure containing code that changes center, transform, etc.
The completion argument will get executed when the animation finishes or is interrupted.

## UIView Animation

* Example

```
if myView.alpha == 1.0 {
    UIViewPropertyAnimator.runningPropertyAnimator(
        withDuration : 3.0,
               delay : 2.0,
             options : [.allowUserInteraction],
          animations : {myView.alpha = 0.0},
          completion : { if $0 == .end { myView.removeFromSuperview() } }
    )
}
```

This would cause myView to "fade" out over 3 seconds (starting 2s from now).
Then it would remove myView from the view hierarchy (but only if the fade completed).
If, within the 5s, someone animated the alpha to non-zero, the removal would not happen.
The output on the console would immediately be .... alpha = 0.0
... even though the alpha on the screen won't be zero for 5 more seconds!

### UIViewAnimationOptions

beginFromCurrentState           // pick up from other, in-progress animations of these properties
allowUserInteraction                // allow gestures to get processed while animation is in progress
layoutSubviews                       // animate the relayout of subviews with a parent's animation
repeat                                      // repeat indefinitely
autoreverse                             // play animation forwards, then backwards
overrideInheritedDuration       // if not set, use duration of any in-progress animation
overrideInheritedCurve           // if not set, use curve (e.g. ease-in/out) of in-progress animation
allowAnimatedContent           // if not set, just interpolate between current and end "bits"
curveEaseInEaseOut              // slower at the beginning, normal throughout, then slow at end
curveEaseIn                            // slower at eh beginning, but then constant through the rest
curveLinear                             // same speed throughout

* Sometimes you want to make an entire view modification at once
In this case you are limited to special properties like alpha, frame and transform 
Flip the entire view over UIViewAnimationOptions.transitionFlipFrom{Left, Right, Top, Bottom}
Dissolve from old to new state .transitionCrossDissolve
Curling up or down .transitionCurl{ Up, Down }


* Example
Flipping a playing card over ...
UIView.transition(with: myPlayingCardView,
                     duration: 0.75,
                      options: [.transitionFlipFromLeft],
                animations: { cardIsFaceUp = !cardIsFaceUp }
                completion: nil)

Presuming myPlayingCardView draws itself face up or down depending on cardIsFaceUp
This will cause the card to flip over (from the left edge of the card)

### Dynamic Animation
* A little different approach to animation
Set up physics relating animatable objects and let them run until they resolve to stasis.
Easily possible to set it up so that stasis never occurs, but that could be performance problem.

### Aside : Closure Capturing

* You can define local variables on the fly at the start of a closure

var foo = { [ x = someInstanceOfaClass, y = "hello"]  in
    // use x and y here
}

* These locals can be declared weak
var foo = { [ weak x = someInstanceOfaClass, y = "hello"] in 
    // use x and y here, but x is now an Optional because it's weak
}

* Or they can even be declared "unowned"
unowned means that the reference counting system does count them (or check the count)
var foo = { [unowned x = someInstanceOfaClass, y = "hello"] in
    //use x and y here, x is not an Optional
    //if you use x here and it is not in the heap, you will crash
}

This, too, is a memory cycle. Why?
The closure assigned to foo keeps self in the heap.
That's because closures are reference types and live in the heap 
and they "capture" variables in their surroundings and keep them in the heap with them.
Meanwhile self's var foo is keeping the closure in the heap.
So foo points to the closure which points back to self which points to the closure.
A cycle.
Neither can leave the heap: there's always going to be a pointer to each (from the other).

* We can break this with the local variable trick
class Zerg {
private var foo = { [weak weakSelf = self] in
    weakSelf?.bar() // need Optional chaining now because weakSelf is an Optional
    }
    private func bar() { ... }
}

Now the closure no longer has a strong pointer to self.
So it is not keeping self in the heap with it.
The cycle is broken.

* The local closure variable is allowed to be called self too
class Zerg {
private var foo = { [weak self = self] in
    self?.bar() //still need chaining because self is a (local) Optional
    }
    private func bar() { ... }
}

There are two different "self" variables here.
The yellow one is local to the closure and is a weak Optional.
The green one is the instance of Zerg itself (and is obviously not weak, nor an Optional).

class Zerg {
private var foo = { [weak self] in
self?.bar() //still need chaining because self is a (local) Optional
}
private func bar() { ... }
}

You don't even need the "= self".
By default, local closure vars are set equal to the var of the same name in their surroundings.

### Memory Cycle Avoidance

* Example of using action and avoiding a memory cycle.

Even more dramatically, we could use `unowned` to break a cycle.
The best example of this is back in our push behavior ...

if let pushBehavior = UIPushBehavior(itmes: [...], mode: .instantaneous) {
    pushBehavior.magnitude = ...
    pushBehavior.angle = ...
    pushBehavior.action = { [unowned pushBehavior] in
        pushBehaivor.dynamicAnimator!.removeBehavior(pushBehavior)
    }
    animator.addBehavior(pushBehavior) //will push right away
}

The action closure no longer captures pushBehavior.
And we can even use this local pushBehavior without any Optional chaining (it's not Optional).
It is safe to mark it unowned because if the action closure exists, so does the pushBehavior.
But we'd better be right. !!!!!


### Coming Up

* Now 
Animation Demo: PlayingCard in Motion
Let's get some cards moving!

* Friday
Source Code Control

* Next Week
View Controller Lifecycle
Table View
Collection View

