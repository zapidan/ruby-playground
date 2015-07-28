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
require 'forwardable'
class Parts
  extend Forwardable
  # delegate size and each to its parts array
  def_delegators :@parts, :size, :each
  include Enumerable
  
  def initialize(parts)
    @parts = parts
  end

  # only choose parts that are needed
  def spares
    select { |part| part.needs_spare }
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

# puts "road bike size #{road_bike.size}"
puts "mtn bike spares #{mountain_bike.spares}" # array of Part instances
puts "mtn bike parts #{mountain_bike.parts}" # Parts instance
puts "#{mountain_bike.parts.class} has size #{mountain_bike.parts.size}"
puts "#{mountain_bike.spares.class} has size #{mountain_bike.spares.size}"