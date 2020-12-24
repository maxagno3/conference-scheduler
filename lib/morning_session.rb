require_relative "qualified_talks"

class MorningSession
  attr_reader :start_time, :end_time, :remaining_time
  include QualifiedTalks

  def initialize
    @start_time = Time.local(2020, "dec", 24, 9)
    @end_time = Time.local(2020, "dec", 24, 12)
    @remaining_time = (@end_time - @start_time)
    @tracks = []
  end
end
