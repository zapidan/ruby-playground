# With the parts factory there is really no need for a Part class
# Part initialization has redundant code. If we just leave the initialization code,
# it can be replaced by a struct or open struct (so it can be initialized with a hash)
require 'ostruct'
module PartsFactory
  def self.build(config,
                 parts_class = Parts)

    parts_class.new(
      config.collect { |part_config| create_part(part_config) })
  end

  def self.create_part(part_config)
    OpenStruct.new(
      name:         part_config[0],
      description:  part_config[1],
      needs_spare:  part_config.fetch(2, true))
  end
end

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


require 'forwardable'
class Parts
  extend Forwardable
  # delegate size and each to its parts array
  def_delegators :@parts, :size, :each
  include Enumerable
  
  def initialize(parts)
    @parts = parts
  end

  # only choose parts that are needed
  def spares
    select { |part| part.needs_spare }
  end
end

## Example usage
# Create configs
road_config =
  [['chain',          '10-speed'],
    ['tire_size',     '23'],
    ['tape_color',    'red']]

mountain_config =
  [['chain',          '10-speed'],
    ['tire_size',     '2.1'],
    ['front_shock',   'Manitou', false],
    ['rear_shock',    'Fox']]

# Create bikes
road_bike = Bicycle.new(
              size:     'L',
              parts:     PartsFactory.build(road_config))

puts "road bike spares #{road_bike.spares}\n\n"

mountain_bike = Bicycle.new(
                  size:     'L',
                  parts:     PartsFactory.build(mountain_config))

puts "mountain bike spares #{mountain_bike.spares}\n\n"

# If in the future a new type of bike is needed...
recumbent_config = 
  [['chain',          '9-speed'],
    ['tire_size',     '28'],
    ['flag',          'tall and orange']]

recumbent_bike = Bicycle.new(
                  size:     'L',
                  parts:     PartsFactory.build(recumbent_config))

puts "recumbent bike spares #{recumbent_bike.spares}"
