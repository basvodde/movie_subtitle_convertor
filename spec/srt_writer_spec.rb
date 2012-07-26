
require 'movie_subtitle_convertor'

describe "Able to write generic format subtitles in the SRT format" do
  
  subject { SrtWriter.new}
  
  it "Should be able to write a simple subtitle to SRT" do
    entry = GenericSubtitleEntry.new
    entry.start = GenericTimecode.new(0, 0, 0, 0)
    entry.end = GenericTimecode.new(1, 1, 1, 0)
    entry.text = "These are subtitles!"
    
    subject.write_entry(entry)
    
    subject.output[0].should == "1"
    subject.output[1].should == "00:00:00,000 --> 01:01:01,000"
    subject.output[2].should == "These are subtitles!"
    subject.output[3].should == ""
  end
  
end

