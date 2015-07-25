# This class now responds to road bikes and other kinds of bicycles
# This is an antipattern and should be abstracted into its own subclass.
# It can lead to errors (trying to access attributes only defined by a certain kind of bike),
# and the if branch will grow if new types want to be added in the future
class Bicycle
  attr_reader :style, :size, :tape_color,
              :front_shock, :rear_shock

  def initialize(args)
    @style        = args[:style]
    @size         = args[:size]
    @tape_color   = args[:tape_color]
    @front_shock  = args[:front_shock]
    @rear_shock   = args[:rear_shock]
  end

  # Here comes all the trouble... Checking for a specific type
  # and sending a different message
  def spares
    if style == :road
      { chain:        '10-speed',
        tire_size:    '23',        # milimeters
        tape_color:   tape_color }
    else
      { chain:        '10-speed',
        tire_size:    '2.1',       # inches
        rear_shock:    rear_shock }
    end
  end
end

bike = Bicycle.new(
        style:        :mountain,
        size:         'S',
        front_shock:  'Manitou',
        rear_shock:   'Fox')

bike.spares