class AfternoonSession
  attr_reader :start_time, :end_time, :remaining_time
  include QualifiedTalks

  def initialize
    @start_time = Time.local(2020, "dec", 24, 13)
    @end_time = Time.local(2020, "dec", 24, 17)
    @remaining_time = (@end_time - @start_time)
    @tracks = []
  end
end
