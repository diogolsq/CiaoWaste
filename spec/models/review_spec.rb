require 'rails_helper'

describe Review do
  let(:diogo) { User.create(email:'diogolsq@hotmail.com', password:'123456', first_name:'Diogo', last_name: 'Queiroz', address: 'R.Francisco Otaviano n 23 apt 1003 bl 1 Rio de Janeiro' ) }
  let(:carretao) { Restaurant.create(name:'carretao', address: 'General Osorio, Rio de Janeiro', telephone: '989893283', user_id: diogo.id) }
  let(:salmao) { Meal.create(name: '1kg de salmão', quantity:20, restaurant_id: carretao.id, old_price: 60.00, new_price: 22.50, datetime: DateTime.now) }

  it "is invalid without the rating" do
    review = Review.create(user_id:diogo.id, meal_id:salmao.id)
    expect(review).to_not be_valid
  end

  it "must be a score between 1 to 5" do
    review = Review.create(user_id:diogo.id, meal_id:salmao.id, rating: 2)

    expect([1 , 2, 3, 4, 5]).to include(review.rating)
  end

end
