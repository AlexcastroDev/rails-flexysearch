class Movie < ApplicationRecord
  has_many :actors
  has_many :photos, through: :actors
end
