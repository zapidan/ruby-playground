## Notes from *Creating Classes That Have a Single Responsibility*

### TRUE Code

- **Transparent**: changes in backend should not affect client using the code
- **Reasonable**: cost of change should be proportional to the benefits the change achieves
- **Usable**: usable in new and unexpected contexts
- **Exemplary**: encourage others to maintain the quality

#### Determine if a class has a `single responsibility`
- A class should be `highly cohesive`: everything it does should be highly related to its purpose -> ask questions for all its methods
- If the future cost of doing nothing is the same as the current cost, postpone the decision -> *you will never know less than what you know right now*

#### Code for change
- **Depend on behavior, not data (use DRY principle)**
- Hide instance variables (even from the class that defines them) -> instance variable given behavior in an accessor method that can change the data in the future. `use a method to wrap an instance variable`
- Hide data structures, delegate to a method to that understand the internal structure and create a struct instead. `use a Struct to wrap a structure`

#### Enforce single responsibility everywhere
- **Methods** should also have a single responsibility, similar to classes -> separate in different methods (like one to iterate over elements, the other to perform an action on each element)
