class Favourite < ActiveRecord::Base

  belongs_to :user
  belongs_to :resource, :polymorphic => true

  validates_presence_of :user, :resource
  
  default_scope where(:deleted => false)
  scope :photos, where("resource_type = 'Photo' OR resource_type = 'Slide'").includes(:resource)
  scope :not_photos, where("resource_type != 'Photo' AND resource_type != 'Slide'").includes(:resource)
  
  has_many :activity_items, :class_name => "YmActivity::ActivityItem", :dependent => :destroy, :as => :resource
  
  class << self
    def create_from_app_params(params)
      resource_type, resource_id = detect_resource(params)
      create(:resource_type => resource_type, :resource_id => resource_id, :deleted => params[:deleted])
    end
    
    def find_from_app_params(params)
      resource_type, resource_id = detect_resource(params)
      find_by_resource_type_and_resource_id(resource_type, resource_id)
    end
    
    def find_or_initialize_from_app_params(params)
      resource_type, resource_id = detect_resource(params)
      find_or_initialize_by_resource_type_and_resource_id(resource_type, resource_id)
    end
    
    def initialize_from_app_params(params)
      attrs = params.slice(:deleted, :updated_at)
      attrs[:resource_type], attrs[:resource_id] = detect_resource(params)
      new(attrs)
    end
    
    def detect_resource(params)
      if params[:event]
        resource_type, resource_id = "Event", params[:event][:id]
      elsif params[:gallery]
        resource_type, resource_id = "Page", params[:gallery][:id]
      elsif params[:photo]
        resource_type, resource_id = "Photo", params[:photo][:id]
      elsif params[:photographer]
        resource_type, resource_id = "User", params[:photographer][:id]
      end
      return resource_type, resource_id.to_i
    end
  end

  def humanized_resource_type
    case resource_type
    when "User"
      "Photographer"
    when "Page"
      "Gallery"
    when "Slide"
      "Photo"
    else
      resource_type
    end    
  end
  
  def as_json(options={})
    hash = {:id => id, :updated_at => updated_at, :deleted => deleted, :synced => true}
    case resource_type
    when "Event"
      hash[:event] = resource.as_json(:only => [:id])
    when "Page"
      hash[:gallery] = resource.as_json(:only => [:id])
    when "Photo"
      hash[:photo] = resource.as_json(:only => [:id])
    when "User"
      hash[:photographer] = resource.as_json(:only => [:id])
    end
    hash
  end

end