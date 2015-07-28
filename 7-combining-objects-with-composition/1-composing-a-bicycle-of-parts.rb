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

# Most of bicycle's code now belongs in Parts
class Parts
  attr_reader :chain, :tire_size
  
  def initialize(args={})
    @chain        = args[:chain]      || default_chain
    @tire_size    = args[:tire_size]  || default_tire_size

    post_initialize args
  end

  def spares
    { chain:        chain,
      tire_size:    tire_size }.merge(local_spares)
  end

  def default_chain # common default to all bikes
    '10-speed'
  end

  def default_tire_size   # Indicate that it requires implementation by subclasses
    raise NotImplementedError,
      "This #{self.class} cannot respond to:"
  end

  # Subclasses may override
  def post_initialize(args)
    nil
  end

  # hook for subclasses to override
  def local_spares
    {}
  end
end

# Instead of bikes subclasses there are now parts subclasses
class RoadBikeParts < Parts
  attr_reader :tape_color

  # Object doesn't know when this message is going to be sent,
  # it doesn't care if it is upon object creation or not
  def post_initialize(args)
    @tape_color = args[:tape_color]
  end

  def local_spares
    { tape_color: tape_color }
  end

  def default_tire_size
    '23' # milimeters
  end
end

class MountainBikeParts < Parts
  attr_reader :front_shock, :rear_shock

  def post_initialize(args)
    @front_shock  = args[:front_shock]
    @rear_shock   = args[:rear_shock]
  end

  def local_spares
    { rear_shock: rear_shock }
  end

  def default_tire_size
    '2.1' # inches
  end
end


# Examples
mountain_bike = Bicycle.new(
                size:  'S',
                parts: MountainBikeParts.new(rear_shock: 'Fox'))

puts "mtn bike size #{mountain_bike.size}"
mountain_bike.parts.tire_size
mountain_bike.parts.chain
puts "mtn bike spares #{mountain_bike.spares}"

road_bike = Bicycle.new(
            size: 'L',
            parts: RoadBikeParts.new(tape_color:'red', tire_size: '100'))

puts "road bike size #{road_bike.size}"
road_bike.parts.chain
puts "road bike spares #{road_bike.spares}"