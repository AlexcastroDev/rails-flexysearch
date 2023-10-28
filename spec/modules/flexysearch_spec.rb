require_relative '../../lib/modules/flexysearch'
require_relative '../../app/models/movie'

RSpec.describe 'Flexysearch' do
  it "has a version number" do
    expect(Flexysearch::VERSION).not_to be nil
  end

  it "should invert dependency of Active Record" do
    flexysearch = Flexysearch.new model: Movie
    expect(flexysearch.model).to eq Movie
  end
end