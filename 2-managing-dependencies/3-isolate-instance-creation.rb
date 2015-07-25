# Isolate Wheel instance creation to the constructor -> this creates a new wheel
#  every time a gear is created, and it might only be needed in one method
class Gear
  attr_reader :chainring, :cog, :rim, :tire, :wheel

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @wheel = Wheel.new(rim, tire)
  end

  def gear_inches
    ratio * wheel.diameter
  end

  def ratio
    chainring / cog.to_f
  end
  # ....
end