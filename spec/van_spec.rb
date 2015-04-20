require 'van'

describe Van do
  it 'on creation is empty' do
    expect(subject.bikes).to eq([])
  end
  it 'can take a bike' do
    subject.capacity = 10
    subject.add_bike :bike
    expect(subject.bikes).to eq([:bike])
  end
  it 'has a capacity' do
    subject.capacity = 10
  end
  it 'raises an error when full' do
    subject.capacity = 10
    10.times { subject.add_bike :bike }
    expect { subject.add_bike :bike }.to raise_error 'Van is full'
  end

end
