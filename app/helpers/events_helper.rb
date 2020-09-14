module EventsHelper
  def attending(user, event)
    link_to 'Attend', "/attend/#{event.id}" if Attendance.attending?(user, event).empty?
  end
end
