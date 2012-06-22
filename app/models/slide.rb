class Slide < ActiveRecord::Base
  
  include YmCms::Slide
  
  def url=(value)
    if value.present? && !value.match(/^.*:\/\//)    
      value = "http://#{value}" 
    end
    write_attribute(:url, value)
  end
  
end