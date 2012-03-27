require 'spec_helper'

describe YmCore::UrlHelper do
  
  describe "link_if_can" do
    
    it "returns '' if cannot do action" do
      helper.stub(:can? => false)
      helper.link_if_can("New page", [:new, Page]).should == ''
    end

    it "returns link_to action if can do new action" do
      helper.stub(:can? => true)
      helper.link_if_can("New page", [:new, Page]).should == link_to("New page", new_page_path)      
    end
    
    it "returns link_to action if can do show action" do
      helper.stub(:can? => true)
      page = FactoryGirl.create(:page)
      helper.link_if_can("Show page", page).should == link_to("Show page", page)
    end
    
    it "returns link_to action if can do edit action" do
      helper.stub(:can? => true)
      page = FactoryGirl.create(:page)
      helper.link_if_can("Edit page", [:edit, page]).should == link_to("Edit page", edit_page_path(page))
    end
    
    it "returns link_to action if can do destroy action" do
      helper.stub(:can? => true)
      page = FactoryGirl.create(:page)
      helper.link_if_can("Delete page", [:destroy, page]).should == link_to("Delete page", page, :method => :delete)
    end
    
  end
  
end