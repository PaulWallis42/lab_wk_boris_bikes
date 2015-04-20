require 'docking_station'
require 'capybara/rspec'

feature 'member of public accesses bike' do
  let(:docking_station) { DockingStation.new }
  scenario 'docking station releases a bike that is not broken' do
    docking_station.capacity = 20
    docking_station.dock Bike.new
    bike = docking_station.release_bike
    expect(bike).not_to be_broken
  end
  scenario 'docking station unable to release as none available' do
    expect { docking_station.release_bike }.to raise_error 'No Bikes Available'
  end
  scenario 'docking station will not make broken bikes available' do
    docking_station.capacity = 20
    broken_bike = Bike.new
    broken_bike.break
    docking_station.dock broken_bike
    expect { docking_station.release_bike }.to raise_error 'No Bikes Available'
  end
end
