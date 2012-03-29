require 'spec_helper'

describe Post do
  
  it {should belong_to(:user)}
  it {should validate_presence_of(:user)}  
  it {should belong_to(:target)}  
  
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
  
  describe "video_embed_id" do
    
    let(:post) {FactoryGirl.build(:post)}
    
    it "returns correct id when Vimeo" do
      post.video_url = "https://vimeo.com/39057126"
      post.video_embed_id.should == "39057126"
    end
    
    it "returns correct id when YouTube" do
      post.video_url = "http://www.youtube.com/watch?v=JVxe5NIABsI"
      post.video_embed_id.should == "JVxe5NIABsI"
    end
    
    it "returns nil when blank" do
      post.video_url = nil
      post.video_embed_id.should == nil
    end
    
  end
  
end