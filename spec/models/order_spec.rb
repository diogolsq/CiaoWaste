require 'rails_helper'


describe Order do
  let(:diogo) { User.create(email:'diogolsq@hotmail.com', password:'123456', first_name:'Diogo', last_name: 'Queiroz', address: 'R.Francisco Otaviano n 23 apt 1003 bl 1 Rio de Janeiro' ) }
  let(:carretao) { Restaurant.create(name:'carretao', address: 'General Osorio, Rio de Janeiro', telephone: '989893283', user_id: diogo.id) }

  it "Order is invalid without the price" do
    order = Order.create(user_id:diogo.id)
    expect(order).to_not be_valid
  end
end
