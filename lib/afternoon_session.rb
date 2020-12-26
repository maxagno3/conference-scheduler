class AfternoonSession
  attr_reader :end_time, :name, :talks, :start_time
  attr_accessor :remaining_time

  def initialize(start_time, end_time)
    @name = "afternoon"
    @start_time = start_time
    @end_time = end_time
    @remaining_time = (@end_time - @start_time) / 60
    @talks = []
  end
end
