require 'spec_helper'

describe Page do
  
  it { should have_one(:slideshow) }

  describe "scope 'without'" do    
    
    it "returns all pages not including the page given" do
      page1 = FactoryGirl.create(:page)
      page2 = FactoryGirl.create(:page)
      Page.without(page1).collect(&:id).should == [page2.id]
    end
  
    it "returns all pages when given nil" do
      page1 = FactoryGirl.create(:page)
      page2 = FactoryGirl.create(:page)
      Page.without(nil).collect(&:id).should == [page1.id, page2.id]
    end
    
    it "returns all pages when given empty array" do
      page1 = FactoryGirl.create(:page)
      page2 = FactoryGirl.create(:page)
      Page.without([]).collect(&:id).should == [page1.id, page2.id]
    end
    
    it "returns all pages when given array of nils" do
      page1 = FactoryGirl.create(:page)
      page2 = FactoryGirl.create(:page)
      Page.without([nil,nil]).collect(&:id).should == [page1.id, page2.id]
    end
    
    it "returns all pages when given new record" do
      page1 = FactoryGirl.build(:page)
      page2 = FactoryGirl.create(:page)      
      Page.without(page1).collect(&:id).should == [page2.id]
    end
    
    it "returns all pages without pages in given array" do
      page1 = FactoryGirl.create(:page)
      page2 = FactoryGirl.create(:page)
      page3 = FactoryGirl.create(:page)
      Page.without([page1, page2]).collect(&:id).should == [page3.id]
    end
    
    it "returns all pages without pages in given array, ignoring new_records" do
      page1 = FactoryGirl.build(:page)
      page2 = FactoryGirl.create(:page)
      page3 = FactoryGirl.create(:page)
      Page.without([page1, page2]).collect(&:id).should == [page3.id]
    end
    
  end

end