require 'van'

describe Van do
  it 'on creation is empty' do
    expect(subject.bikes).to eq([])
  end
  it 'can not take an unbroken bike' do
    subject.capacity = 10
    unbroken_bike = double :bike, broken?: false
    expect { subject.add_bike unbroken_bike }.to raise_error 'Bike is not broken'
  end
  it 'can take a broken bike' do
    subject.capacity = 10
    broken_bike = double :bike, broken?: true
    subject.add_bike broken_bike
    expect(subject.bikes).to eq([broken_bike])
  end
  it 'has a capacity' do
    subject.capacity = 10
  end
  it 'raises an error when full' do
    subject.capacity = 10
    unbroken_bike = double :bike, broken?: true
    10.times { subject.add_bike unbroken_bike }
    expect { subject.add_bike unbroken_bike }.to raise_error 'Van is full'
  end
end
