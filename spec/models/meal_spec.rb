require 'rails_helper'
require 'date'


describe Meal do
  let(:diogo) { User.create(email:'diogolsq@hotmail.com', password:'123456', first_name:'Diogo', last_name: 'Queiroz', address: 'R.Francisco Otaviano n 23 apt 1003 bl 1 Rio de Janeiro' ) }
  let(:carretao) { Restaurant.create(name:'carretao', address: 'General Osorio, Rio de Janeiro', telephone: '989893283', user_id: diogo.id) }

  it "is invalid without the name" do
    meal = Meal.create(quantity: 50, restaurant_id: carretao.id, old_price: 60.00, new_price: 22.50, datetime: DateTime.now)
    expect(meal).to_not be_valid
  end

  it "is invalid without the quantity" do
    meal = Meal.create(name: '1kg de salmão', restaurant_id: carretao.id, old_price: 60.00, new_price: 22.50, datetime: DateTime.now)
    expect(meal).to_not be_valid
  end


  it "is invalid without the old price" do
    meal = Meal.create(name: '1kg de salmão', quantity:20, restaurant_id: carretao.id, new_price: 22.50, datetime: DateTime.now)
    expect(meal).to_not be_valid
  end


  it "is invalid without the new price" do
    meal = Meal.create(name: '1kg de salmão', quantity:20, restaurant_id: carretao.id, old_price: 60.00, datetime: DateTime.now)
    expect(meal).to_not be_valid
  end


  it "is invalid without the datetime" do
    meal = Meal.create(name: '1kg de salmão', quantity:20, restaurant_id: carretao.id, old_price: 60.00, new_price:22.0)
    expect(meal).to_not be_valid
  end

end
