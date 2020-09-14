module EventsHelper
  def attending(user, event)
    return user.attendances.where(event_id: event.id).empty?
  end
end
