# Configurations to build Parts
# 2 dim array  with name, description and needs_spare values
road_config =
  [['chain',          '10-speed'],
    ['tire_size',     '23'],
    ['tape_color',    'red']]

mountain_config =
  [['chain',          '10-speed'],
    ['tire_size',     '2.1'],
    ['front_shock',   'Manitou', false],
    ['rear_shock',    'Fox']]


module PartsFactory
  def self.build(config,
                 parts_class = Parts,
                 part_class  = Part)

    parts_class.new(
      config.collect do |part_config|
        part_class.new(                   # Initializing a part should be handled in the factory
          name:         part_config[0],
          description:  part_config[1],
          needs_spare:  part_config.fetch(2, true)) # This is being duplicated in the Part class
      end
    )
  end
end

# Parts Class from previous example
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

# Part class from previous example
class Part
  attr_reader :name, :description, :needs_spare

  def initialize(args)
    @name = args[:name]
    @description = args[:description]
    @needs_spare = args.fetch(:needs_spare, true) # pick boolean value from hash using fetch to avoid nil/always false gotcha
  end
end

# Examples to create parts:
road_parts = PartsFactory.build(road_config)
puts "road parts: #{road_parts.inspect}"

mountain_parts = PartsFactory.build(mountain_config)
puts "mountain parts: #{mountain_parts.inspect}"