class User < ApplicationRecord
	has_many :attendances
  has_many :events, through: :attendances
  has_many :events, foreign_key: "creator_id",class_name: "Event"
end
