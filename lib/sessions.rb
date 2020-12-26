require_relative "qualified_talks"

class Sessions
  include QualifiedTalks
  attr_reader :qualified_talks, :talks, :incomplete_talks, :tracks

  def initialize(track1, track2)
    @tracks = [track1, track2]
    @qualified_talks = QualifiedTalks::Talks
    @incomplete_talks = []
  end

  # def start_sessions(sessions)
  #   lightning_talk, normal_talk = qualified_talks.partition { |talk| talk.is_a? LigtningTalks }
  #   schedule_talks(normal_talk)
  # end

  def add_to_tracks(track, talk)
    if track.morning?(track)
     track.add_to_session(talk, true)
    elsif track.afternoon?(track)
     track.add_to_session(talk, false)
    else
      incomplete_talks << talk
    end
    p incomplete_talks
  end

  def schedule_talks
    count = 0
    track1, track2 = tracks

    while !qualified_talks.empty?
      talk = qualified_talks.first

      add_to_tracks(track1, talk) if count.even?
      add_to_tracks(track2, talk) if count.odd?

      count += 1 if !talk.kind_of? (LigtningTalks)

      qualified_talks.shift

      # lightning_talk, normal_talk = qualified_talks.partition { |talk| talk.is_a? LigtningTalks }
    end
    return [track1, track2, incomplete_talks]
  end
end
