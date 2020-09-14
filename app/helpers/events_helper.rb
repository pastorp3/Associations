module EventsHelper
  def attending(user, event)
    user.attendances.where(event_id: event.id).empty?
  end
end
