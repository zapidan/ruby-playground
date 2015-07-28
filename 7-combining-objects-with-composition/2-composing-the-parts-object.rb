# Bicycle composed of parts, which is the new superclass
class Bicycle
  attr_reader :size, :parts

  def initialize(args={})
    @size         = args[:size] 
    @parts         = args[:parts] 
  end

  def spares
    parts.spares
  end
end

# Parts is now a wrapper around an array of Part objects
# Part objects are free to have whichever name they want
class Parts
  attr_reader :parts
  
  def initialize(parts)
    @parts = parts
  end

  # only choose parts that are needed
  def spares
    parts.select { |part| part.needs_spare }
  end
end

# Now there is a common Part class, instead of a Part class per bike type.
# This makes adding new parts (and new bikes with different types) much easier
class Part
  attr_reader :name, :description, :needs_spare

  def initialize(args)
    @name = args[:name]
    @description = args[:description]
    @needs_spare = args.fetch(:needs_spare, true) # pick boolean value from hash using fetch to avoid nil/always false gotcha
  end
end

## Examples
# Create all needed parts
chain = Part.new(
          name: 'chain', description: '10-speed')

tape = Part.new(
              name: 'tape_color', description: 'red')

road_tire = Part.new(
              name: 'tire_size', description: '23')

mountain_tire = Part.new(
              name: 'tire_size', description: '2.1')

rear_shock = Part.new(
              name: 'rear_shock', description: 'Fox')

front_shock = Part.new(
                name: 'front_shock', description: 'Manitou', needs_spare: false)

# Now create the bikes with the Parts object (which contains all needed parts)
mountain_bike = Bicycle.new(
                size:  'L',
                parts: Parts.new([chain, mountain_tire, front_shock, rear_shock]))

puts "mtn bike size #{mountain_bike.size}"
puts "mtn bike spares #{mountain_bike.spares}"

road_bike = Bicycle.new(
            size: 'L',
            parts: Parts.new([chain, road_tire, tape]))

puts "road bike size #{road_bike.size}"
puts "road bike spares #{road_bike.spares}"