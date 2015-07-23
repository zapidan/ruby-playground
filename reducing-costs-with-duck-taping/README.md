## Notes from *Reducing Costs with Duck Taping*

- Duck types are public interfaces that are not tied to a specific class, but defined by their behavior
- "If an object quacks like a duck and walks like a duck, then it is a duck"
- Use of a duck type makes your code more abstract, making it easier to extend but harder to understand
- **Polymorphism**: ability of different objects to respond to the same message, a message has many forms. Any object implementing a polymorphic method can be substituted for any other; the sender of the message need not know or caer about this substitution.
  * Duck typing is a way to achieve polymorphism
  * Duck typing reveals underlying abstractions that might be invisible, creating virtual types that are defined by what they do instead of by who they are.


### Writing Code that Relies on Ducks
- Design challenge: realize where you need a duck and abstract its interface

#### Hidden Duck Patterns: 
- The following statements indicate the presence of an unidentified duck
  * case/when that switch on class names -> all of the classes in the when branches share a common behavior
  * kind_of? and is_a? that check on the class of an object -> same as case/when
  * responds_to? -> there are still dependencies even if there are no explicit references to class names
- Indicates a missing object wich a public interface which has not yet been discovered. The class of the object that implements it does not matter at all, trust the implementers to behave correctly
- If the classes are stable (ruby core), it is fine to add a check for them via kind_of? It would be riskier to monkey patch core ruby classes to add a duck

#### Static vs Dynamic Typing
 - Statically typed languages require the declaration of each variagle and method parameter. The compiler unearths type errors at compile time, but run time errors are still present (null pointer exceptions among others). Compiled code is optimized to run quickly.
 - Dynamically typed languages allow you to put any value in any variable and pass any argument to any method, without further declaration.. Code is interprated and dynamically loaded without a compilation cycle. Metaprogramming is easier and application development is faster without a make cycle.



