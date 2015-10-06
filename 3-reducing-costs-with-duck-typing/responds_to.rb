# Class names are not referenced, but there is still a dependency
# on method names, hence specific classes. 
# A duck type should be used instead!
if preparer.responds_to?(:prepare_bicycles)
  preparer.prepare_bicycles(bicycles)
elsif preparer.responds_to?(:buy_food)
  preparer.buy_food(customers)
elsif preparer.responds_to?(:gas_up)
  preparer.gas_up(vehicle)
  preparer.fill_water_tank(vehicle)
end