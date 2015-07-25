## Notes from *Acquiring Behavior Through Inheritance*

### Classical (*derived from class*) Inheritance
- Code sharing technique built into the language syntax: if one object can't respond to a received message, it delegates it to another (subclass to superclass)
- Antipattern: check an attribute (or class type) that holds the category of self to determine what message to send to self. *I know who you are and because of that I know what you do* See example 2, this leads to errors due to poor design -> should use subclasses to share code instead.

### Refactoring to an Abstract Class
- First find the abstraction from a concrete class. If only 1 object is expected there is no reason to create an abstraction. If you have 2 object subclasses and expect to have more soon, postpone the creation of the abstract class, since if you have more info the abstraction will be better.
- See what code should be common (usually duplicated), then promote abstractions, instead of demoting concretions (up the chain rather than down). If you start by creating the abstract class you risk adding concrete code, that will lead to problems in the future (dependencies, 'if type' antipattern etc.)

### Using the Template Method Pattern
- Defining a basic structure in the superclass and sending messages to acquire subclass-specific contributions
- Should raise a NotImplementedError in the parent class if it expects subclasses to implement it
- Using this patterns makes all subclasses coupled to its parent. Any subclass needs to know how to interact with their superclass (calling super, merging hashes etc.). This pushes the knowledge of the algorithm down into the subclasses, forcing them to participate. If one forgets to call super, unexpected swallen behavior could appear.

### Decoupling Subclasses Using Hook Messages
- Instead of requiring subclasses to call its parent via super, superclasses can send hook messages
- They exist solely to provide subclasses a plae to contribute information by overriding matching methods
- This strategy removes knowledge of the algorithm from the subclass and returns control to the superclass  
- Subclasses are responsible for *what* initialization it needs, but not *when* it occurs -> control of the timing in the superclass means the algorithm can change without forcing changes upon the subclasses