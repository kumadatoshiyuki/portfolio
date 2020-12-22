class UserNote < ApplicationRecord
  belongs_to :user, optional: true
  validates :body_temperature, numericality: true
  validates :attendance_confirmation, inclusion: { in: [true, false] }
  validates :sleep_start, presence: true
  validates :sleep_end, presence: true
  validates :number_toilet, presence: true
  validates :breakfast, presence: true
  validates :dinner, presence: true
  validates :message, presence: true, length: { in: 0..600 }
  validates :record_date, presence: true
  
  
end
