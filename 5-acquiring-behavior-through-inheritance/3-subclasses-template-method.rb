# Abstract parent class
class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    @size         = args[:size] 
    @chain        = args[:chain]      || default_chain
    @tire_size    = args[:tire_size]  || default_tire_size
  end

  def spares
    { chain:        chain,
      tire_size:    tire_size }
  end

  def default_chain # common default to all bikes
    '10-speed'
  end

  def default_tire_size   # Indicate that it requires implementation by subclasses
    raise NotImplementedError,
      "This #{self.class} cannot respond to:"
  end
end


class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args) # rest of arguments are initialized in parent class
  end

  def spares
    super.merge({ tape_color: tape_color })
  end

  def default_tire_size
    '23' # milimeters
  end
end

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock  = args[:front_shock]
    @rear_shock   = args[:rear_shock]
    super(args)
  end

  def spares
    super.merge({ rear_shock: rear_shock })
  end

  def default_tire_size
    '2.1' # inches
  end
end


# Examples
mountain_bike = MountainBike.new(
        size:         'S',
        front_shock:  'Manitou',
        rear_shock:   'Fox')

mountain_bike.size
mountain_bike.tire_size
mountain_bike.chain
mountain_bike.spares

road_bike = RoadBike.new(
        size:         'S',
        tape_color:   'red')

road_bike.size
road_bike.tire_size
road_bike.chain
road_bike.spares