## Notes from *Designing Cost Effective Tests*

### Motivations for Testing
- Before writing tests you must understand OO design and be skilled at **refactoring**: process of changing a sw system in a way that it does not alter the external behavior of the code yet improves the internal structure
- The most important benefit of testing is that it reduces costs. In particular it helps:
  * Finding bugs early
  * Supplying updated documentation
  * Defering design decisions: ex. can't anticipate future abstractions
  * Supporting abstractions
  * Exposing design flaws: when the design is bad, testing is hard (painful setup indicates too much context, too many objects indicaet too many dependencies. If the test is hard to write, other objects will find the code difficult to reuse)

### What to Test
- Fewer tests, no duplication: test everything once in the proper place
- An object is only the messages to which it responds to, and this should be applied to testing as well
- Tests should have limited couplings and only to stable interfaces
- **Tests of state**: assert values that messages return -> test incoming messages in its own public interface
- **Query messages**: outgoing messages with no side effects that matter only to the sender -> part of the public interface of the receiver, so only tested in receiver
- **Command messages**: outgoing messages with side effects (db, file..) -> sender should test they are properly sent (behavior, not state)

### When to Test
- Test-first approach: "novice programmers don't yet have the skills to write simple code"
- Apply OO principles to the tests so it can be easily updated in the future
- Testing first also allows to explore a problem and discover new solutions

### How to Test
- BDD(outside in) and TDD(inside out) both promote testing first
- Focus on the specific object under test, remain ignorant of everything else

### Testing Incoming Messages
- Incoming messages make up an object's public interface, the face it presents to the world. They need testing because other objects depend on their signatures and return values

### Delete Unused Interfaces + Prove the Public Interface
- Do not test an incomming message that has no dependents; delete it


### Isolate the Object Under Test
