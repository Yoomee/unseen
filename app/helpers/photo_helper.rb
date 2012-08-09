module PhotoHelper
  
  def add_to_collection_link(photo, options ={})
    options.merge!(
      :remote => true,
      :'data-photo-id' => photo.id
    )
    options[:class] = "#{options[:class]} tooltip-bottom".strip
    if current_user && current_user.collected_photos.include?(photo)
      url = remove_photo_path(photo)
      options.merge!(:method => :delete, :title => "Remove from collection")
      options[:class] += " add-to-collection add-to-collection-active"
    elsif current_user
      url = add_photo_path(photo)
      options.merge!(:method => :post, :title => "Add to my collection")      
      options[:class] += " add-to-collection"
    end
    link_to(url, options) do
      content_tag(:i, "", :class => "icon-heart")
    end
  end
  
end