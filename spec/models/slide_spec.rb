require 'spec_helper'

describe Slide do
  
  it {should belong_to(:slideshow)}
  
  describe do
    
    let(:slide) {Factory(:slide)}
    
    it "should be valid" do
      slide.should be_valid
    end
    
  end    
  
end