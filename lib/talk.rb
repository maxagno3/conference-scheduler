class Talk
  def self.register(topic, time_duration)
    if time_duration == 5
      LigtningTalks.new(topic, time_duration)
    else
      NormalTalks.new(topic, time_duration)
    end
  end
end

class LigtningTalks
  attr_reader :topic, :time_duration

  def initialize(topic, time_duration)
    @topic = topic
    @time_duration = time_duration  
  end
end

class NormalTalks
  attr_reader :topic, :time_duration
  
  def initialize(topic, time_duration)
    @topic = topic
    @time_duration = time_duration
  end
end
