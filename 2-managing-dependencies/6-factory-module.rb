# Gear is an external interface you can't modify
module SomeFramework
  class Gear
    attr_reader :chainring, :cog, :wheel
    def initialize(chainring, cog, wheel)
      @chainring = chainring
      @cog = cog
      @wheel = wheel
    end
    # ....
  end
end

# Wrap the interface in your own module to control instance creation. It essentially works as a factory
module GearWrapper
  # Method class in a module suggests it is not meant to be instantiated
  def self.gear(args)
    SomeFramework::Gear.new(args[:chainring],
                            args[:cog],
                            args[:wheel])
  end
end

# Create a new Gear object
gear = GearWrapper.gear(chainring: 52,
                        cog: 11,
                        wheel: Wheel.new(26, 1.5))

