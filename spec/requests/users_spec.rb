require File.dirname(__FILE__) + '/../spec_helper'
include Devise::TestHelpers

describe "Users" do

  describe "GET /users#show" do
    let(:user) { FactoryGirl.create(:user) }
    it "shows user profile" do
      visit user_path(user)
      page.should have_content(user.to_s)
    end
    describe "adding a post" do
      before do
        visit user_path(user)
      end
      it "displays new post when valid" do
        fill_in 'post_text', :with => "A new post"
        click_button 'Post'
        page.should have_selector("div.posts div.post")
      end
      
      it "display error when invalid" do
        fill_in 'post_text', :with => ""
        click_button 'Post'
        page.should have_selector("form.post_form .error")
      end
    end
  end  
end
