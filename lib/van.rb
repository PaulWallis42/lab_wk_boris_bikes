require_relative 'bike'
require_relative 'docking_station'
require_relative 'garage'

class Van
  attr_reader :bikes
  attr_writer :capacity

  def initialize
    @bikes = []
  end

  def add_bike(bike, from)
    fail 'Bike is not broken' if bike.broken? == false
    fail 'Van is full' if full?
    @bikes << bike
    from.bikes.delete(bike)
  end

  def add_fixed_bike(bike, from)
    fail 'Bike is still broken' if bike.broken? == true
    fail 'Van is full' if full?
    @bikes << bike
    from.bikes.delete(bike)
  end

  private

  def full?
    @bikes.length >= @capacity
  end
end
