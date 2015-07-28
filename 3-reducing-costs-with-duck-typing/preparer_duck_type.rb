# Trip preparation is easier with a preparer duck type
class Trip
  attr_reader :bicycles, :customers, :vehicle

  def prepare(preparers)
    preparers.each { |preparer| preparer.prepare_trip(self) }
  end
end

# Preparer is a duck that responds to prepare_trip
# Flexible extension, a new preparer can be added in the future
# so long as it implements the prepare_trip method
class Mechanic
  def prepare_trip(trip)
    this.bicycles.each { |bicycle| prepare_bicycle(bicycle) }
  end

  protected
  def prepare_bicycle(bicycle)
    # ...
  end
end

class TripCoordinator
  def prepare_trip(trip)
    this.customers.each { |customer| buy_food(trip.customers) }
  end

  protected
  def buy_food(customers)
    # ...
  end
end

class Driver
  def prepare_trip(trip)
    vehicle = trip.vechicle
    gas_up(vehicle)
    fill_water_tank(vehicle)
  end

  protected
  def gas_up(vehicle)
    # ...
  end

  def fill_water_tank(vehicle)
    # ...
  end
end