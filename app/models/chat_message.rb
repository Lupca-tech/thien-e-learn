class ChatMessage < ApplicationRecord
  belongs_to :teacher, optional: true
  belongs_to :student, optional: true
end
