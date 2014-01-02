require 'spec_helper'

feature 'Admin can create car', %q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lost
} do
  # I must specify the color, year, mileage of the car.
  # Only years from 1980 and above can be specified.
  # I can optionally specify a description of the car.
  # If I enter all of the required information in the required format, the car is recorded.
  # If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
  # Upon successfully creating a car, I am redirected so that I can create another car.

  it 'can create a new car with valid input' do

    visit '/cars'
    expect(page).to have_content('List a new car!')

    click_on 'List a new car!'
    fill_in 'Make', with: 'Mazda'
    fill_in 'Color', with: 'blue'
    fill_in 'Year', with: '1999'
    fill_in 'Mileage', with: '80000'
    click_on 'Create Car'

    expect(page).to have_content('Mazda')
  end

  it 'does not create a new car without valid input' do
    visit '/cars'

    click_on 'List a new car!'
    click_on 'Create Car'
    expect(page).to have_content("Makecan't be blank")
  end

  it 'can add a description to the car' do
    visit '/cars/new'

    fill_in 'Make', with: 'Mazda'
    fill_in 'Color', with: 'blue'
    fill_in 'Year', with: '1999'
    fill_in 'Mileage', with: '80000'
    fill_in 'Description', with: 'GABBA GAABBBAA GGADJWNDEIJNIKEFF'
    click_on 'Create Car'

    expect(page).to have_content("Mazda")
  end

end
