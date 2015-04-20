require 'van'

describe Van do
  it 'on creation is empty' do
    expect(subject.bikes).to eq([])
  end
  it 'has a capacity' do
    subject.capacity = 10
  end
  it 'can not take an unbroken bike' do
    subject.capacity = 10
    unbroken_bike = double :bike, broken?: false
    dock_station = double :docking_station, bikes: [:broken_bike, :unbroken_bike]
    expect { subject.add_bike unbroken_bike, dock_station }.to raise_error 'Bike is not broken'
  end
  it 'can take a broken bike' do
    subject.capacity = 10
    broken_bike = double :bike, broken?: true
    dock_station = double :docking_station, bikes: [:broken_bike, :unbroken_bike]
    subject.add_bike broken_bike, dock_station
    expect(subject.bikes).to eq([broken_bike])
  end
  it 'removes the taken bike from docking station' do
    subject.capacity = 10
    broken_bike = double :bike, broken?: true
    dock_station = double :docking_station, bikes: [broken_bike, :unbroken_bike]
    subject.add_bike(broken_bike, dock_station)
    expect(dock_station.bikes).to eq([:unbroken_bike])
  end
  it 'raises an error when full' do
    subject.capacity = 10
    unbroken_bike = double :bike, broken?: true
    dock_station = double :docking_station, bikes: [:broken_bike, :unbroken_bike]
    10.times { subject.add_bike unbroken_bike, dock_station }
    expect { subject.add_bike unbroken_bike, dock_station }.to raise_error 'Van is full'
  end
end
