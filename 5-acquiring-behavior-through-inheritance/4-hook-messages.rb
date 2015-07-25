# Abstract parent class
class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    @size         = args[:size] 
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


class RoadBike < Bicycle
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

class MountainBike < Bicycle
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


# New bike created in the future...
class RecumbentBike < Bicycle
  attr_reader :flag

  # Object doesn't know when this message is going to be sent,
  # it doesn't care if it is upon object creation or not
  def post_initialize(args)
    @flag = args[:flag]
  end

  def local_spares
    { flag: flag }
  end

  def default_tire_size
    '28' # milimeters
  end

  def default_chain
    '9-speed'
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