require 'spec_helper'

describe Post do
  
  it {should belong_to(:user)}
  it {should validate_presence_of(:user)}  
  
  describe do
    
    let(:post) {FactoryGirl.create(:post)}
    
    it "should be valid" do
      post.should be_valid
    end
    
    it "should be valid if text is blank and no image" do
      post.attributes = {:text => "", :image => nil}
      post.should_not be_valid
    end
    
  end    
  
end