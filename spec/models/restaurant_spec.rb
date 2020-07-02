require 'rails_helper'

describe Restaurant do
  let(:diogo) { User.create(email:'diogolsq@hotmail.com', password:'123456', first_name:'Diogo', last_name: 'Queiroz', address: 'R.Francisco Otaviano n 23 apt 1003 bl 1 Rio de Janeiro' ) }
  let(:carretao) { Restaurant.create(name:'carretao', address: 'General Osorio, Rio de Janeiro', telephone: '989893283', user_id: diogo.id) }

  it "Restaurant is invalid without the address" do
    restaurant = Restaurant.create(name:'carretao', user_id:diogo.id)
    expect(restaurant).to_not be_valid
  end

  it "Restaurant is invalid without the name" do
    restaurant = Restaurant.create(address:'General osorio, Rio de Janeiro', user_id:diogo.id)
    expect(restaurant).to_not be_valid
  end

  it "Restaurant is invalid without the telephone" do
    restaurant = Restaurant.create(name:'carretao', address:'General osorio, Rio de Janeiro', user_id:diogo.id)
    expect(restaurant).to_not be_valid
  end

  it 'a new Restaurant should have a rating of zero ' do
    expect(carretao.rating).to eq(0)
  end
end
