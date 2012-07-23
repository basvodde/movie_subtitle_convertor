
require 'movie_subtitle_convertor'

describe "Reading the DVD Studio Pro STL format" do

  subject { StlReader.new}
  
  it "Should parse a normal variable assignment line" do
    subject.parse_one_line(" $FontName			=	Arial")
    subject.value["FontName"].should == "Arial"
  end
  
  it "Should parse an empty line" do
    subject.parse_one_line("")
    subject.value.empty?.should == true
  end
  
  it "Should remove the comments at the end" do
    subject.parse_one_line("$FadeIn				=	0 // In number of Frames")
    subject.comment["FadeIn"].should == "In number of Frames"
  end
  
  context "Parse an entry field" do
    before(:each) do
      subject.parse_one_line("00:00:03:15	,	00:00:05:26	,	Tonight, The Deep Dive.")
    end

    it "Should be able to parse the start entry fields" do
      subject.subtitles[0].start.hours.should == 0
      subject.subtitles[0].start.minutes.should == 0
      subject.subtitles[0].start.seconds.should == 3
      subject.subtitles[0].start.milliseconds.should == 15
    end
    
    it "Should be able to parse end end entry fields" do
      subject.subtitles[0].end.hours.should == 0
      subject.subtitles[0].end.minutes.should == 0
      subject.subtitles[0].end.seconds.should == 5
      subject.subtitles[0].end.milliseconds.should == 26      
    end
    
    it "Should be able to parse the text field in the entry" do
      subject.subtitles[0].text.should == "Tonight, The Deep Dive."
    end
  end
  
end