module PhotoHelper
  def add_to_collection_link(photo, options ={})
    options.merge!(
      :remote => true,
      :'data-photo-id' => photo.id
    )
    options[:class] ||= ""
    if current_user && current_user.collected_photos.include?(photo)
      url = remove_photo_path(photo)
      options[:method] = :delete
      options[:class] += " add-to-collection add-to-collection-active"
      link_text = "Remove from collection"
    elsif current_user
      url = add_photo_path(photo)
      options[:method] = :post
      options[:class] += " add-to-collection"
      link_text = "Add to my collection"
    end
    link_to link_text, url, options
  end
end