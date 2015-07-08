class RevealingReferences
  attr_reader :wheels

 # some unknown structure is passed, wheelify appropriately parses it into wheels
  def initialize(data)
    @wheels = wheelify(data)
  end

  # doesn't know the original data structure. The intent is also more clear
  def diameters
    wheels.collect { |wheel| wheel.rim + (wheel.tire * 2) }
  end

  Wheel = Struct.new(:rim, :tire)

  # converts array of array into array of wheel structs
  def wheelify(data)
    data.collect { |cell|  
      Wheel.new(cell[0], cell[1]) }
  end
end

@data = [[622, 20], [622, 23], [559, 30], [559, 40]]
revealing_references = RevealingReferences.new(@data)
puts revealing_references.inspect
diameters = revealing_references.diameters
puts diameters.inspect