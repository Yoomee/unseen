require 'spec_helper'

describe Slideshow do
  
  it {should belong_to(:attachable)}
  it {should have_many(:slides)}
  
  describe do
    
    let(:slideshow) {Factory(:slideshow)}
    
    it "should be valid" do
      slideshow.should be_valid
    end
    
  end    
  
end