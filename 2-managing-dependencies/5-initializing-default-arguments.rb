## specifying defaults using ||
# GOTCHA: imposible to set field if it is a boolean that defaults to true
# @bool = args[:boolean_field] || true
def initialize(args)
  @chainring = args[:chainring] || 40
  @cog       = args[:cog]       || 18
  @wheel     = args[:wheel]
end

## Specifying defaults using fetch
# fields can be set to false or nil
def initialize(args)
  @chainring = args.fetch(:chainring, 40)
  @cog       = args.fetch(:cog, 18)
  @wheel     = args[:wheel]
end

## Specifying defaults by merging a defaults hash. Isolate defaults hash to a method
def initialize(args)
  args = defaults.merge(args)
  @chainring = args[:chainring] 
  @cog       = args[:cog]       
  @wheel     = args[:wheel]
end

# useful when defaults are complicated
def defaults
  { chainring: 40, cog: 18 }
end