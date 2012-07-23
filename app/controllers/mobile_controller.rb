class MobileController < ApplicationController
  
  layout 'mobile'
  
  before_filter :debug
  
  private
  def debug
    puts request.env.select{|k,v| k.match("^HTTP.*")}.inspect
  end
    
end