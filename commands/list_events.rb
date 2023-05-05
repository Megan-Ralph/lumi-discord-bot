bot.command :list_events do |event|
  message = "Upcoming events:\n"
  events.each do |event|
    message += "- #{event[:name]} on #{event[:date]} at #{event[:time]} in #{event[:location]}\n"
  end

  event.respond message
end
