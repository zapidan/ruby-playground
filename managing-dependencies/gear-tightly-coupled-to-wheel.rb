class Gear
  attr_reader :chainring, :cog, :rim, :tire
 
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire 
  end

  def ratio
    chainring / cog.to_f
  end

## Tightly coupled to Wheel:
  # Expects a class named Wheel to exist
  # Expects a Wheel instance to respond to a diameter method
  # Knows a new Wheel instance requires a rim and a tire
  # Knows the order of the arguments required to create a new Wheel instance
  def gear_inches
    ratio * Wheel.new(rim, tire).diameter
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end

# example run
wheel = Wheel.new(26, 1.5)
gear = Gear.new(52, 11, wheel)
puts "gear inches: #{gear.gear_inches}"
puts "gear ratio: #{gear.ratio}"