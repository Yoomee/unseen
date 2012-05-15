require 'spec_helper'

describe Photo do
  
  it { should belong_to(:photographer) }

  describe "an instance" do    
    
    it "is valid" do
      photo = FactoryGirl.create(:photo)
      photo.should be_valid
    end
    
  end

end