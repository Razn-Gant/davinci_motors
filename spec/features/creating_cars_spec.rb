require 'rails_helper'

feature 'Creating Cars' do
  scenario 'can create a car' do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    expect(page).to have_content('1967 Ford Mustang created')
  end

  scenario 'can make another car' do
    car = FactoryGirl.create(:car)
    visit '/'
    expect(page).to have_content("#{car.make} #{car.model} #{car.year} #{car.price}")


  end
  scenario 'can see made cars on homepage' do
    car1 = FactoryGirl.create(:car)
    car2 = FactoryGirl.create(:car)
    visit '/'
    expect(page).to have_content("#{car1.make} #{car1.model} #{car1.year} #{car1.price}")
    expect(page).to have_content("#{car2.make} #{car2.model} #{car2.year} #{car2.price}")

  end

  scenario 'can edit cars' do
    visit '/'
    car = FactoryGirl.create(:car)
    visit edit_car_path(car)

    fill_in 'Make', :with => 'Ford'
    fill_in 'Model', :with => 'Mustang'
    fill_in 'Year', :with => '1967'
    fill_in 'Price', :with => '2300'
    click_button "Update"
    expect(page).to have_content("Ford Mustang 1967 2300")
  end
end
