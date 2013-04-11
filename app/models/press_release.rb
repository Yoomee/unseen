class PressRelease < ActiveRecord::Base
  include YmCore::Model

  file_accessor :file
  default_scope order("date DESC")
  
  def to_s
    title
  end
  
end