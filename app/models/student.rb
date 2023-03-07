class Student < ApplicationRecord
  has_many :schedules, inverse_of: :student
  
  has_one :countdown, :dependent => :destroy
  
  accepts_nested_attributes_for :schedules, reject_if: :all_blank, allow_destroy: true

end
