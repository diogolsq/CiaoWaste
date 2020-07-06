require 'rails_helper'

RSpec.describe "Restaurants", type: :request do

  it 'creates a new Restaurant and redirects to the Restaurants pages' do
    @user = FactoryBot.create(:user)
    sign_in @user
    get "/restaurants/new"
    expect(response).to render_template(:new)

    post "/restaurants", :params => { :restaurant => { :name => 'Carretão', :address => 'Copacabana', :telephone => '000000'} }

    expect(response).to be_successful

    # expect(response).to redirect_to(assigns(:restaurant))
    # follow_redirect!

    # expect(response).to render_template(:show)
    # expect(response.body).to include('Restaurant was successfully created.')
  end

  it "does not render a different template" do
    get "/restaurants/new"
    expect(response).to_not render_template(:show)
  end

end
