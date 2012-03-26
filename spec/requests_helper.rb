module RequestsHelper

  def login_admin
    login_user(FactoryGirl.create(:admin_user))
  end
  
  def login_user(user = FactoryGirl.create(:user))
    visit sign_in_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button I18n.t(:login)
  end
  
end