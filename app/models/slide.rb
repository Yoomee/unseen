class Slide < ActiveRecord::Base
  
  include YmCms::Slide
  
  def url=(value)
    value = "http://#{value}" unless value.match(/^.*:\/\//)
    write_attribute(:url, value)
  end
  
end