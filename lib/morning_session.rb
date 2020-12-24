class MorningSession
  attr_reader :start_time, :end_time, :name

  def initialize(start_time, end_time)
    @name = "morning"
    @start_time = start_time
    @end_time = end_time
    @remaining_time = (end_time - start_time) / 60
  end
end
