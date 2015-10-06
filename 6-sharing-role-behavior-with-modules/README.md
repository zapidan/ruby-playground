## Notes from *Sharing Role Behavior with Modules*

### Sharing Roles
- Use of classical inheritance is always optional, every problem that it solves can be solved in a way that makes more sense
- Some unrelated (relationship sense) objects share some common behavior or role. Some roles appear after design time
- *"is a" vs. "behaves like a"*
- **Modules** can be mixed in to any object, so it is the perfect place to define a named group of methods that are independent of class
- This way, the total set of messages to which an object can respond includes:
  * Those it implements
  * Those implemented in all objects above it in the hierarchy
  * Those implemented in any module that has been added to it
  * Those implemented in all modules added to any object above it in the hierarchy  

- You should remove unnecessary dependencies, objects should be able to respond for themselves -> If you are interested in getting a property from object B, you should not rely on objet A (passing object B) to get that information from object B, you should ask object B directly. For example, instead of `StringUtils.empty?(some_string)`, do `some_string.empty?`

### Looking Up Methods
- When an object sends a message, the methods are looked up in the chain. superclasses and modules in the order explained above
- `Extends adds the module's behavior directly to an object`
- When modules are in play there are different possibilities:
  * Module is **included** in a class -> messages become **instance methods** in that class
  * Module is **extended** in a class -> messages become **class methods** in that class
  * Module is **extended** in an instance of a class -> messages become **instance methods in that instance**

### Writing Inheritable Code
- Inheritance hierarchies and modules need to be maintainable, and it shows the code quality. Some good techniques for this are:

#### Recognize the Antipatterns
- If an object uses a variable 'type' or 'category' to determine the message, this usually indicates **classical inheritance** -> common code in an abstract superclass and subclasses for each 'type'
- If an object checks the class to determine the message, this usually indicates a **duck type** -> receivers should implement the duck type's interface
- In addition to sharing an interface, duck types might also share behavior -> place the shared code in a module and include it in each class or object that plays the role

#### Insist on the Abstraction
- All the code in an abstract superclass should apply to every class that inherits it -> bad sympton is an overriden method that raises a 'does not implemement' exception
- The code in a module must apply to all who use it

#### Honor the Contract
- `Subclasses promise to be substitutable for their superclass`, they must respond to every message in their superclass's interface
- Subclasses can have a little bit of freedom on input arguments and return values without violating their contract
- `Liskov Substitution Principle LSP`, "L" in SOLID

#### Use the Template Method Pattern
- Abstract code defines the algorithms
- Concrete inheritors of that abstraction contribute specializations by overriding these template methods
- Template methods represent the parts of the algorithms that vary

#### Preemptively Decouple Classes
- Inheritance adds dependendencies on the structure of the code, avoid adding additional dependencies by requiring subclasses to send super
- Use **hook messages** to allow subclasses to participate while absolving them from knowing the algorithm

#### Create Shallow Hierarchies
- Shallow, narrow hierarchies are easy to understand; shallow, wide hierarchies are slightly more complicated
- The rest of the combinations should be avoided:
  * Deep, narrow hierarchies are challenging and have a natural tendency to get wider as a side effect of their depth
  * Deep, wide hierarchies are difficult to understand, costly to maintain and should be avoided
