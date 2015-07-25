# This represents a simple bicycle
class Bicycle
  attr_reader :size, :tape_color

  def initialize(args)
    @size       = args[:size]
    @tape_color = args[:tape_color]
  end

  # Every bike has the same defaults for tire and chain size
  def spares
    { chain:      '10-speed',
      tire_size:   '23',
      tape_color:   tape_color }

  # Other common methods 
  # .....

end

bike = Bicycle.new(
        size:       'M',
        tape_color: 'red' )
bike.size
bike.spares