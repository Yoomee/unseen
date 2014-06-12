class Document < ActiveRecord::Base

  file_accessor :file

  validates :name, :file, :presence => true

  def to_s
    name
  end

end
