module EventManager
  def self.create_event(name, date, time, location)
    new_event = {
      name: name,
      date: date,
      time: time,
      location: location,
      attendees: []
    }

    events = []
    events << new_event

    new_event
  end

  def self.add_attendee(event_name, attendee_name)
    event_to_join = events.find { |event| event[:name] == event_name }

    if event_to_join
      event_to_join[:attendees] = []
      event_to_join[:attendees] << attendee_name

      event_to_join
    else
      nil
    end
  end

  def self.get_event(name)
    events.find { |event| event[:name] == name }
  end

  def self.get_upcoming_events
    events.select { |event| DateTime.parse(event[:date] + " " + event[:time]) > DateTime.now }
  end

  def self.add_reminder(event_name, reminder_time)
    event_to_remind = events.find { |event| event[:name] == event_name }

    if event_to_remind
      reminder_time = Time.parse(reminder_time)
      reminder_time = "#{reminder_time.min} #{reminder_time.hour} * * *"

      scheduler = Rufus::Scheduler.singleton
      scheduler.cron reminder_time do
        channel = bot.channel(CONFIG[:channel_id])
        message = "#{event_name} starts in 10 minutes!"
        channel.send_message(message)
      end

      reminder_time
    else
      nil
    end
  end

  private

  def self.events
    @events ||= []
  end
end
