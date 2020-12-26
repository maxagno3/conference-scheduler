class MorningSession
  attr_reader :end_time, :name, :talks
  attr_accessor :start_time, :remaining_time

  def initialize(start_time, end_time)
    @name = "morning"
    @start_time = start_time
    @end_time = end_time
    @remaining_time = (@end_time - @start_time) / 60
    @talks = []
  end
end
