# Widget Tree and Element Tree

WIDGET TREE = configuration(rebuilds frequently)  
⬇︎
ELEMENT TREE = Links widgets with rendered object(rarely rebuilds)
⬇︎
RENDER TREE = Rendered objects on the screen(rarely rebuilds)

Ex.
MyStateful Widget
⬇
Container Element →→ State
⬇
Rendered Box

# Const Constructor

When state changes flutter will call build method again
and make new widget

CONSIDER making your constructor const if the class supports it.
Adding "const" in front of widgets ensures that
Flutter never tries to rebuild those.
The prerequisite for that is a "const" constructor function.

# GOOD CODE

---

## 1) READIBILITY

You should understand your code and be able to maintain/change it.
Think about your "future self"!
Others should understand your code and be able to maintain/change it

## 2) PERFORMANCE

Certain practices can improve app performance
But missing performance improvements does not automatically result in a bad /laggy app
Always re-evaluate your code, explore new best practices

# WIDGET LIFECYCLE

---

## 1) Stateless Widget

Constructor Fn
⬇︎
build()

## 2) Stateful Widget

Costructor function
⬇︎
initState()
⬇︎
build()
⬇︎
setState()
⬇︎
didUpdateWidget()
⬇︎
build()

dispose()

# App Lifecycle

1. inactive = App is inactive, no user input received
2. paused = App not visible to user, running in background
3. resumed = App is (again) visible and responding to user input
4. suspending = App is about to be suspended(exited)
