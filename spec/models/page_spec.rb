require 'spec_helper'  

describe Page do
  
  it { should belong_to(:parent) }
  it { should have_many(:children) }
  it { should validate_presence_of(:title) }

  describe do  
    
    let(:page) { Factory(:page) } 
    
    it "should be valid" do
      page.should be_valid
    end
    
    it "should validate presence of title" do
      page.title = nil
      page.should have(1).error_on(:title)
    end
    
    it "cannot be it's own parent" do
      page.parent_id = page.id
      page.should have(1).error_on(:parent)
    end
  
    it "cannot be a child of it's child" do
      child_page = Factory.create(:page, :title => "Child page", :parent => page, :id => page.id + 1)
      page.parent_id = child_page.id
      page.should have(1).error_on(:parent)
    end
    
    it "should have the default view name" do
      page.view_name.should eq('basic')
    end
    
  end
  
  describe "scope 'without'" do    
    
    it "returns all pages not including the page given" do
      page1 = Factory.create(:page)
      page2 = Factory.create(:page)
      Page.without(page1).collect(&:id).should == [page2.id]
    end
  
    it "returns all pages when given nil" do
      page1 = Factory.create(:page)
      page2 = Factory.create(:page)
      Page.without(nil).collect(&:id).should == [page1.id, page2.id]
    end
    
    it "returns all pages when given empty array" do
      page1 = Factory.create(:page)
      page2 = Factory.create(:page)
      Page.without([]).collect(&:id).should == [page1.id, page2.id]
    end
    
    it "returns all pages when given array of nils" do
      page1 = Factory.create(:page)
      page2 = Factory.create(:page)
      Page.without([nil,nil]).collect(&:id).should == [page1.id, page2.id]
    end
    
    it "returns all pages when given new record" do
      page1 = Factory.build(:page)
      page2 = Factory.create(:page)      
      Page.without(page1).collect(&:id).should == [page2.id]
    end
    
    it "returns all pages without pages in given array" do
      page1 = Factory.create(:page)
      page2 = Factory.create(:page)
      page3 = Factory.create(:page)
      Page.without([page1, page2]).collect(&:id).should == [page3.id]
    end
    
    it "returns all pages without pages in given array, ignoring new_records" do
      page1 = Factory.build(:page)
      page2 = Factory.create(:page)
      page3 = Factory.create(:page)
      Page.without([page1, page2]).collect(&:id).should == [page3.id]
    end
    
  end
  
  describe "has snippets" do  
    Page.has_snippets(:snippet_name)
    
    let(:page) { Factory(:page) }
    
    it "should have many snippets" do
      page.should have_many(:snippets)
    end
    
    it "should respond to snippet name getter" do
      page.should respond_to(:snippet_name)
    end
    
    it "should return text of snippet" do
      page1 = Factory.create(:page)
      snippet = Factory.create(:snippet, :item => page1)
      page1.send(snippet.name).should eq(snippet.text)
    end
    
    it "should respond to snippet name setter" do
      page.should respond_to("snippet_name=")
    end
    
    it "be able to set text of snippet" do
      page1 = Factory.create(:page)
      snippet = Factory.create(:snippet, :item => page1)
      page1.send("#{snippet.name}=", "New snippet text")
      page1.send(snippet.name).should eq("New snippet text")
    end
      
  end
  
end