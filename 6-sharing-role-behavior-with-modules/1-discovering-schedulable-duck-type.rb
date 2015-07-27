# Sample Schedule Implementation
class Schedule
  def scheduled?(schedulable, start_date, end_date)
    puts "This #{schedulable.class} " +
          "is not scheduled\n" +
          " between #{start_date} and #{end_date}"
    false
  end
end


# Concrete Implementation of a Schedulable class, in this case a Bicycle
# The shared code will be extracted into its own module in the next example
class Bicycle
  attr_reader :schedule, :size, :chain, :tire_size

  # Inject the Schedule and provide a default
  def initialize(args={})
    @schedule = args[:schedule] || Schedule.new
    # ... initialize rest of attributes
  end

  # Return true if this bicycle is available
  # during this (now Bicycle specific) interval
  def schedulable?(start_date, end_date)
    !scheduled?(start_date - lead_days, end_date)
  end

  # Return the schedule's answer
  def scheduled?(start_date, end_date)
    schedule.scheduled?(self, start_date, end_date)
  end

  # Return the number of lead_days before a bicycle
  # can be schedule
  def lead_days
    1
  end

  # ....
end

# Example use:
require 'date'
starting = Date.parse("2015/09/04")
ending = Date.parse("2015/09/10")

b = Bicycle.new
b.schedulable?(starting, ending)