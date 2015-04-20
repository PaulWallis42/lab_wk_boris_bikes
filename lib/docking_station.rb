require_relative 'bike'

class DockingStation
  attr_writer :capacity, :bikes

  def initialize
    @bikes = []
  end

  def dock bike
    fail 'Station Full' if full?
    @bikes << bike
    nil
  end

  def release_bike
    fail 'No Bikes Available' if empty?
    @bikes.pop
  end

  private

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.reject(&:broken?).length == 0
  end
end
