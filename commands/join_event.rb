bot.command :join_event do |event, *args|
  event_name = args.join(' ')
  event_to_join = events.find { |event| event[:name] == event_name }

  if event_to_join
    event_to_join[:attendees] ||= []
    event_to_join[:attendees] << event.user.name

    event.respond "#{event.user.name} has joined the #{event_name} event!"
  else
    event.respond "Event not found: #{event_name}"
  end
end
