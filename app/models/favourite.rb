class Favourite < ActiveRecord::Base

  belongs_to :user
  belongs_to :resource, :polymorphic => true

  validates_presence_of :user, :resource

  def humanized_resource_type
    case resource_type
    when "User"
      "Photographer"
    when "Page"
      "Gallery"
    else
      resource_type
    end    
  end

end