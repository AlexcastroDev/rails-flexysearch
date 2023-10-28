class Api::MoviesController < ApplicationController
  include Flexysearch

  def index
    @movies = Flexysearch::Paginate.new(model: Movie).paginate.all
    render json: @movies
  end
end
