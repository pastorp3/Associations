class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :creator, class_name: 'User'
  scope :past_events, -> { where("date < ?", Date.today) }
  scope :upcoming_events, -> { where("date >= ?", Date.today) }
end
