bot.command :create_event do |event, *args|
  name, date, time, location = args

  new_event = {
    name: name,
    date: date,
    time: time,
    location: location,
    attendees: []
  }

  events ||= []
  events << new_event

  event.respond "Event created: #{name}, #{date} at #{time} in #{location}"
end
