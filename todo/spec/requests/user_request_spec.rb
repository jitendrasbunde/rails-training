require 'rails_helper'
require 'faker'

RSpec.describe UserController, type: :controller do
  before do
    User.create(name: Faker::Name.name ,age: 21)
  end
  it "get list of users" do
    get :index
    byebug
    expect(response).to have_http_status(:success)
  end

  it "get user by id" do
    post '/user/1'
    expect(response).to have_http_status(:success)
  end
  
end
