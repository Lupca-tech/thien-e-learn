class Micropost < ApplicationRecord
  belongs_to :teacher

  delegate :subject, to: :teacher
end
