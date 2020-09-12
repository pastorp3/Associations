module EventsHelper
  def event_clasify_events(events, direction)
    results = []
    events.each do |e|
      if Date.today > e.date && direction == 'past'
        results.push(e)
      elsif Date.today <= e.date && direction == 'future'
        results.push(e)
      end
    end
    results
  end
end
