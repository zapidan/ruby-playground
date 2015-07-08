class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  # Use reader instead of instance variable
  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    # tire goes around rim twice for diameter
    ratio * (rim + (tire * 2))
  end
end

# example run
gear = Gear.new(52, 11, 26, 1.5)
puts "gear inches: #{gear.gear_inches}"
puts "gear ratio: #{gear.ratio}"