## Notes from *Creating Public Interfaces*

### Finding Public Interfaces
- Public interfaces (ie. public methods within a class) are exposed to other objects and guaranteed to be stable
- Hide implementation details. Ask **what instead of how** -> similar to command pattern, if the implementation of the procedure changes, the client is not affected, since it can still send the `what` message, even if the how has changed in the private interface

### Seeking Context Independence
- A class has a single responsibility but `expects a context`, which has a direct effect on how difficult it is to reuse -> `trust other objects to do their job`
- Use messages to discover objects (and define use cases with UML diagrams)
- Create explicit interfaces using public/protected/private keywords
- Use only public external interfaces, if you need to use a private one wrap the private methods in your own public interface

### The Law of Demeter
- "Only talk to your immediate neighbors", "use only one dot"
- Dot chains are referred to as train wrecks
- *Using delegation to hide tight coupling is not the same as decoupling the code*