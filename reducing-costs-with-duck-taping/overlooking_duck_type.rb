# Trip preparation has too many dependencies
class Trip
  attr_reader :bicycles, :customers, :vehicle

  def prepare(preparers)
    preparers.each do |preparer|
      case preparer
      when Mechanic
        preparer.prepare_bicycles(bicycles)
      when TripCoordinator
        preparer.buy_food(customers)
      when Driver
        preparer.gas_up(vehicle)
        preparer.fill_water_tank(vehicle)
      end
    end
  end
end

# For now only Mechanic, TripCoordinator and Driver exist
# Lots of dependencies, and more in the future, since it introduces a pattern
class Mechanic
  def prepare_bicycles(bicycles)
    bicycles.each { |bicycle| prepare_bicycle(bicycle) }
  end

  protected
  def prepare_bicycle(bicycle)
    # ...
  end
end

class TripCoordinator
  def buy_food(customers)
    buy_food(customers)
  end

  protected
  def buy_food(customers)
    # ...
  end
end

class Driver
  def gas_up(vehicle)
    # ...
  end

  def fill_water_tank(vehicle)
    # ...
  end
end