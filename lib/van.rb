require_relative 'bike'

class Van
  attr_reader :bikes
  attr_writer :capacity

  def initialize
    @bikes = []
  end

  def add_bike bike
    fail 'Van is full' if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length >= @capacity
  end
end
