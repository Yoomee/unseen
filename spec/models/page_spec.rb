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
  
  describe "that has snippets" do
    Page.has_snippets(:test_snippet)
    
    let(:page) { FactoryGirl.create(:page) }
    
    it "has many snippets" do
      page.should have_many(:snippets)
    end
    
    it "responds to snippet name getter" do
      page.should respond_to(:test_snippet)
    end
    
    it "responds to snippet name setter" do
      page.should respond_to("test_snippet=")
    end
    
    it "can set text of snippet" do
      page1 = FactoryGirl.create(:page, :test_snippet => "New snippet text")
      page1.test_snippet.should eq("New snippet text")
    end
    
    it "won't create snippet until page is created" do
      page1 = FactoryGirl.build(:page)
      page1.test_snippet = "New snippet text"
      Snippet.where(:item_id => nil).count.should == 0
    end

    it "can update snippet" do
      page1 = FactoryGirl.create(:page, :test_snippet => "Old snippet text")
      page1.test_snippet = "New snippet text"
      page1.test_snippet.should == "New snippet text"
    end
    
    it "destroy blank snippets" do
      page1 = FactoryGirl.create(:page, :test_snippet => "Snippet text")
      page1.test_snippet = ""
      page1.snippets.where(:name => "test_snippet").count == 0
    end
      
  end

end