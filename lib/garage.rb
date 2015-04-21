require_relative 'bike'

class Garage
  attr_reader :bikes
  attr_writer :capacity

  def initialize
    @bikes = []
  end

  def take_bike(bike)
    fail 'This bike is not broken' if bike.broken? == false
    fail 'Garage is full' if full?
    @bikes << bike
  end

  def fix_bike(bike)
    bike.fix
  end

  private

  def full?
    @bikes.length >= @capacity
  end
end
