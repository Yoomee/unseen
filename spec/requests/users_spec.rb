require File.dirname(__FILE__) + '/../spec_helper'
include Devise::TestHelpers

# describe "Users" do
# 
#   describe "GET /users#show", :js => true, :driver => :selenium_chrome do
#     self.use_transactional_fixtures = false
#     let(:user) { FactoryGirl.create(:user) }
#     before do
#       login_user(user)
#       visit user_path(user)
#     end
#     it "shows user profile" do
#       page.should have_content(user.to_s)
#     end
#     describe "adding a post" do
#       it "displays new post when valid" do
#         fill_in 'post_text', :with => "A new post"
#         click_button 'Post'
#         page.should have_selector("div.posts div.post")
#       end
#       
#       it "display error when invalid" do
#         fill_in 'post_text', :with => ""
#         click_button 'Post'
#         page.should have_selector("form.post_form .error")
#       end
#     end
#     after do
#       User.destroy_all
#       Post.destroy_all
#     end
#   end
#   
# end
