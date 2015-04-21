require 'garage'

describe Garage do
  it 'can take a bike' do
    subject.capacity = 25
    bike = double :bike, broken?: true
    subject.take_bike(bike)
    expect(subject.bikes).to eq([bike])
  end
  it 'can only take a broken bike' do
    subject.capacity = 10
    unbroken_bike = double :bike, broken?: false
    expect { subject.take_bike(unbroken_bike) }.to raise_error 'This bike is not broken'
  end
  it 'has a capacity' do
    subject.capacity = 10
    bike = double :bike, broken?: true
    10.times { subject.take_bike(bike) }
    expect { subject.take_bike(bike) }.to raise_error 'Garage is full'
  end
  it 'can fix a bike' do
    subject.capacity = 10
    bike = double('Fixing')
    allow(bike).to receive(:fix)
    expect(bike).to respond_to(:fix)
  end
end
