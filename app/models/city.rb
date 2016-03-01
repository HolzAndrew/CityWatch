class City < ApplicationRecord
  has_many :officers
  has_many :videos
end
