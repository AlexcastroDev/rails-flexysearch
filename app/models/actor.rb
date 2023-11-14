class Actor < ApplicationRecord
  has_many :photos
  belongs_to :movie
end
