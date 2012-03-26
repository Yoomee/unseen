require 'spec_helper'

describe User do
  
  it {should have_many(:posts)}
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:password)}
  it {should validate_presence_of(:first_name)}
  it {should validate_presence_of(:last_name)}    
  
  describe do
    
    let(:user) {FactoryGirl.create(:user)}
    
    it "should be valid" do
      user.should be_valid
    end
    
  end    
  
end