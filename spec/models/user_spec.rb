require 'rails_helper'


describe User do
  let(:diogo) { User.create(email:'diogolsq@hotmail.com', password:'123456', first_name:'Diogo', last_name: 'Queiroz', address: 'R.Francisco Otaviano n 23 apt 1003 bl 1 Rio de Janeiro' ) }

  it "user is valid with when it has first_name, last_name, address" do

    expect(diogo).to be_valid
  end

  it "When the user doesn't say what is his role, the role will be buyer" do
    expect(diogo.role).to eq('buyer')
  end

  it "When the user doesn't say nothing he won't be admin" do
    expect(diogo.Admin).to be(false)

  end

  it 'is not valid with the same email of a another user' do
    user = User.create(email:'diogolsq@hotmail.com', password:'123456', first_name:'teste', last_name: 'Queiroz', address: 'R.Francisco Otaviano n 23 apt 1003 bl 1 Rio de Janeiro' )
    user = User.new(email:'diogolsq@hotmail.com', password:'123456', first_name:'teste', last_name: 'Queiroz', address: 'R.Francisco Otaviano n 23 apt 1003 bl 1 Rio de Janeiro' )
    expect(user).to_not be_valid
  end
end
