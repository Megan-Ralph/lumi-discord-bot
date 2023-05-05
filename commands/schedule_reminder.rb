require 'rufus-scheduler'
require_relative 'event_manager'

scheduler = Rufus::Scheduler.singleton

bot.command :schedule_reminder do |event, *args|
  event_name, reminder_time = args

  reminder_time = EventManager.add_reminder(event_name, reminder_time)

  if reminder_time
    event.respond "Reminder scheduled for #{event_name} at #{reminder_time}."
  else
    event.respond "Event not found: #{event_name}"
  end
end
