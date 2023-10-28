require 'rails_helper'

RSpec.describe Api::MoviesController, type: :request do
  describe "GET Movies" do

    before(:all) do
      20.times do |i|
        Movie.create(title: "Movie #{i}", year: 2020, description: "Description #{i}")
      end
    end

    it "Should paginate the controller" do
      get '/api/movies'

      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to eq(10)
    end
  end
end
