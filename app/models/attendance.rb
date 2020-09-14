class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def self.attending?(user, event)
    user.attendances.where(event_id: event.id)
  end
end
