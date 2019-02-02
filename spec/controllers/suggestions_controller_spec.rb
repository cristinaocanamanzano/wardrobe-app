require 'rails_helper'

RSpec.describe SuggestionsController, type: :controller do
  before(:each) do
     user = User.create(user_name: "Cris", email: "email@email.com", password: "password")
  end

  describe "GET /" do
    it "responds with 302" do
      get :index
      expect(response).to have_http_status(302)
    end
  end
end
