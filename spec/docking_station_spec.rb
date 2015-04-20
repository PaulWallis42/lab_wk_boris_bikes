require 'docking_station'

describe DockingStation do
  it 'releases bikes that are not broken' do
    subject.capacity = 21
    subject.dock double :bike, broken?: false
    bike = subject.release_bike
    expect(bike).not_to be_broken
  end
  it 'can dock a bike' do
    subject.capacity = 21
    expect(subject.dock :bike).to be nil
  end
  it 'raises error when no bikes available' do
    expect { subject.release_bike }.to raise_error 'No Bikes Available'
  end
  it 'raises an error when full' do
    subject.capacity = 20
    20.times { subject.dock double :bike }
    expect { subject.dock double :bike }.to raise_error 'Station Full'
  end
  it 'has a flexible capacity' do
    subject.capacity = 20
    20.times { subject.dock double :bike }
    expect { subject.dock double :bike }.to raise_error 'Station Full'
    subject.capacity = 21
    expect { subject.dock double :bike }.not_to raise_error
  end
end
