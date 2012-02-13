require 'spec_helper'  
  
describe Page do
  it { should belong_to(:parent) }
  it { should have_many(:children) }
  
  it { should validate_presence_of(:title) }
  
  describe "default factory" do  
    let(:page) { Factory(:page) }  
    it "should be valid" do
      page.should be_valid
    end
    
    it "should validate presence of title" do
      page.title = nil
      page.should_not be_valid
    end
  end  
end