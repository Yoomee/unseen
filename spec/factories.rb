FactoryGirl.define do

  factory :permalink do |f|  
    f.path "page-title"
    f.association :resource, :factory => :page
  end
  
end