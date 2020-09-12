module UsersHelper
  def user_clasify_events(events, direction)
    results = []
    events.each do |e|
      if Date.today > e.event.date && direction == 'past'
        results.push(e.event)
      elsif Date.today <= e.event.date && direction == 'future'
        results.push(e.event)
      end
    end
    results
  end
end
