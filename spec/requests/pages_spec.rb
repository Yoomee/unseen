require 'spec_helper'

describe "Pages" do
  
  describe "GET /pages" do
    it "should list page titles" do
      cms_page = Factory(:page)
      visit pages_path
      page.should have_content(cms_page.title)
    end
  end

  describe "GET /pages#show" do
    it "should show page title" do
      cms_page = Factory(:page)  
      visit page_path(cms_page)
      page.should have_content(cms_page.title)
    end
  end
  
  describe "GET /pages#new" do
    it "should show page form" do
      visit new_page_path
      page.has_css? "form#new_page"
    end
  end
  
  describe "GET /pages#edit" do
    it "should show page form" do
      cms_page = Factory(:page)      
      visit edit_page_path(cms_page)
      page.has_css? "form#edit_page_#{cms_page.id}"
    end
  end
  
  describe "create a page" do
    it "should redirect to pages#show if valid" do
      visit new_page_path
      fill_in 'Title', :with => "New page title"
      click_button 'Save'
      current_url.should eq(page_url(Page.last))
      page.should have_content("New page title")
    end
    it "should render pages#edit if invalid" do
      visit new_page_path
      fill_in 'Title', :with => ""
      click_button 'Save'
      current_url.should eq(pages_url)
      page.has_css? "form#new_page"
    end  
  end
  
  describe "update a page" do
    it "should redirect to pages#show if valid" do
      cms_page = Factory(:page, :title => "Old page title")
      visit edit_page_path(cms_page)
      fill_in 'Title', :with => "Updated page title"
      click_button 'Save'
      current_url.should eq(page_url(cms_page))
      page.should have_content("Updated page title")
    end
    it "should render pages#edit if invalid" do
      cms_page = Factory(:page, :title => "Old page title")
      visit edit_page_path(cms_page)
      fill_in 'Title', :with => ""
      click_button 'Save'
      current_url.should eq(page_url(cms_page))
      page.has_css? "form#edit_page_#{cms_page.id}"
    end   
  end
  
end
