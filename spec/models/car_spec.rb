require 'spec_helper'

describe Car do
  it {should have_valid(:make).when('Mazda', 'Toyota')}
  it {should_not have_valid(:make).when(nil,'')}

  it {should have_valid(:color).when('Mazda', 'Toyota')}
  it {should_not have_valid(:color).when(nil,'')}

  it {should have_valid(:year).when(1999, 2023)}
  it {should_not have_valid(:year).when(nil,'', 'erer', 1116)}

  it {should have_valid(:mileage).when(12324, 1)}
  it {should_not have_valid(:mileage).when(nil,'', 'two')}

  it 'can make a factory girl of it' do
    FactoryGirl.create(:car)
    expect(Car.all.count).to eql(1)
  end

end
