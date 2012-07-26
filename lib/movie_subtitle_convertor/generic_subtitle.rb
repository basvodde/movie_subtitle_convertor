
class GenericTimecode
  attr_reader :hours, :minutes, :seconds, :milliseconds
  
  def initialize(hours, minutes, seconds, milliseconds)
    @hours = hours
    @minutes = minutes
    @seconds = seconds
    @milliseconds = milliseconds
  end
  
end

class GenericSubtitleEntry
  
  attr_accessor :start, :end, :text
  
end

