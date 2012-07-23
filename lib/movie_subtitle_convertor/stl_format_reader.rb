
class StlTimeCode
  attr_reader :hours, :minutes, :seconds, :milliseconds
  
  def initialize(hours, minutes, seconds, milliseconds)
    @hours = hours.to_i
    @minutes = minutes.to_i
    @seconds = seconds.to_i
    @milliseconds = milliseconds.to_i
  end
end

class StlSubtitleEntry
  attr_accessor :start, :end, :text
end

class StlReader

  def parse_one_line(line)
    
    matchdata = line.match /^(\d\d):(\d\d):(\d\d):(\d\d)\s*,\s*(\d\d):(\d\d):(\d\d):(\d\d)\s*,\s*(.*)/
    if (matchdata)
      subtitle_entry = StlSubtitleEntry.new
      subtitle_entry.start = StlTimeCode.new(matchdata[1], matchdata[2], matchdata[3], matchdata[4])
      subtitle_entry.end = StlTimeCode.new(matchdata[5], matchdata[6], matchdata[7], matchdata[8])
      subtitle_entry.text = matchdata[9]
      subtitles.push subtitle_entry
    end
    
    matchdata = line.match /^\s*\$(\w*)\s*=\s*(\w*)\s*\/*\s*(.*)\s*$/
    if (matchdata)
      value[matchdata[1]] = matchdata[2] unless matchdata[2].nil?
      comment[matchdata[1]] = matchdata[3] unless matchdata[3].nil?
    end
  end
  
  def value
    @values ||= {}
  end
  
  def comment
    @comments ||= {}
  end
  
  def subtitles
    @subtitles ||= []
  end
  
end
