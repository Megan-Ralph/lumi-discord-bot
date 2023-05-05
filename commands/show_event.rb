bot.command :show_event do |event, *args|
  event_name = args.join(' ')

  event_to_show = events.find { |event| event[:name] == event_name }

  if event_to_show
    message = "Event details:\n"
    message += "Name: #{event_to_show[:name]}\n"
    message += "Date: #{event_to_show[:date]}\n"
    message += "Time: #{event_to_show[:time]}\n"
    message += "Location: #{event_to_show[:location]}\n"
    message += "Attendees: #{event_to_show[:attendees].join(', ')}\n"

    event.respond message
  else
    event.respond "Event not found: #{event_name}"
  end
end