require_relative "afternoon_session"
require_relative "morning_session"

class Tracks
  attr_reader :name, :sessions

  def initialize(number)
    @name = number
    @sessions = [
      MorningSession.new(Time.local(2020, "dec", 24, 9), Time.local(2020, "dec", 24, 12)),
      AfternoonSession.new(Time.local(2020, "dec", 24, 13), Time.local(2020, "dec", 24, 17)),
    ]
  end

  def get_schedule
    schedule = ""

    sessions.each { |session| result += "#{session.name} session will be starting from #{session.start_time}\n" }

    puts schedule
  end
end
