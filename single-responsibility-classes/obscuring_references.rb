class ObscuringReferences
  attr_reader :data

  def initialize(data)
    @data = data
  end

  # depends on the data structure
  def diameters
    # 0 is rim, 1 is tire
    data.collect { |cell|  cell[0] + (cell[1] * 2) }
  end
end


# example usage
# rim and tire sizes in mm in a 2nd array
@data = [[622, 20], [622, 23], [559, 30], [559, 40]]
obscuring_references = ObscuringReferences.new(@data)
puts obscuring_references.inspect
diameters = obscuring_references.diameters
puts diameters.inspect