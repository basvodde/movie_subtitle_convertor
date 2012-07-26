

class SrtWriter
  
  attr_reader :output
  
  def initialize
    @output = []
  end
  
  
  def write_entry(entry)
    output[0] = "1"
    # "00:00:00,000 --> 01:01:01,000"
    output[1] = "%02d:%02d:%02d,%03d --> %02d:%02d:%02d,%03d" % 
    [ entry.start.hours, entry.start.minutes, entry.start.seconds, entry.start.milliseconds,
      entry.end.hours,   entry.end.minutes,   entry.end.seconds,   entry.end.milliseconds ]
    output[2] = entry.text
    output[3] = ""
    
    
  end
  
end