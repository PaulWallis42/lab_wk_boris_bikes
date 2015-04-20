require_relative 'bike'
require_relative 'docking_station'

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

  private

  def full?
    @bikes.length >= @capacity
  end
end
