## Notes from *Combining Objects with Composition*

### Composition
- Allows you to combine small parts to create more complex objects such that the whole becomes more than the sum of its parts
- Using a factory is a good idea when creating composed objects

###  Has-a Relationship: Composition vs Aggregation
- Both concepts are similar. In fact, aggregation is just a special case of composition
- Composition: the contained object has no life independent of its container (ie. university-departments)
- Aggregation: the contained object has an independent life from its container (ie. university-professors)

### Inheritance vs Composition
- Inheritance: code arrangement. Behavior is dispersed among objects which are organized into class relationships, such that automatic delegation of messages invokes the correct behavior
- Composition: objects stand alone and must explicitly know about and delegate messages to one another. It allows objects to have structural independence, at the cost of explicit message delegation
- `Favor Composition over Inheritance where possible, since it has fewer built in dependencies`
- It is difficult to model a hierarchy, more so to anticipate new behaviors
- Composed objects are small, structurably independent, and have well defined interfaces. They are pluggable components easy to extend and with a high tolerance for change
- `Inheritance is specialization, is-a relationships`
- `Use duck types for behaves-like-a relationships` A new role is defined and shared among unrelated objects
- `Use composition for has-a relationships` The more parts an object has, the more likely it is that it should be modeled with composition. The deeper you drill into individual parts, the more likely it is you'll discover a specific part with specialized variants that could be modeled with inheritance