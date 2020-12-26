require_relative "afternoon_session"
require_relative "morning_session"
require_relative "sessions"

class Tracks
  attr_reader :number, :morning, :afternoon

  def initialize(number)
    @number = number
    @morning = MorningSession.new(Time.local(2020, 12, 24, 9), Time.local(2020, 12, 24, 12))
    @afternoon = AfternoonSession.new(Time.local(2020, 12, 24, 13), Time.local(2020, 12, 24, 17))
  end

  def morning?(track)
    track.morning.name == "morning" && track.morning.remaining_time != 0
  end

  def afternoon?(track)
    track.afternoon.name == "afternoon" && track.afternoon.remaining_time != 0
  end

  def add_to_session(talk, is_morning)
    if is_morning
      talk.start_time = morning.start_time.strftime("%H:%M %p")
      morning.talks << talk
      morning.remaining_time -= talk.time_duration
      morning.start_time += talk.time_duration
    else
      talk.start_time = afternoon.start_time.strftime("%H:%M %p")
      afternoon.talks << talk
      afternoon.remaining_time -= talk.time_duration
      afternoon.start_time += talk.time_duration
    end
  end

  def get_schedule
    schedule = ""

    sessions.each do |session|
      schedule += "Track #{number}: #{session.name.capitalize} session will be starting from #{session.start_time}\n"
    end

    puts schedule
  end
end

track1 = Tracks.new("track1")
track2 = Tracks.new("track2")
schedule = Sessions.new(track1, track2)
schedule.schedule_talks
schedule.print_talks
