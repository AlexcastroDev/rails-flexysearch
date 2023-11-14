class Photo < ApplicationRecord
  belongs_to :actor

  attribute :image_url, :string
end
