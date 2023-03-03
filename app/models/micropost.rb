class Micropost < ApplicationRecord
  belongs_to :teacher
  has_one_attached :image
end
