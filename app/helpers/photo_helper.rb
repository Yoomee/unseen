module PhotoHelper
  def add_to_favourites_link(photo, options ={})
    options.merge!(
      :remote => true,
      :'data-photo-id' => photo.id
    )
    options[:class] ||= ""
    if current_user && current_user.favourite_photos.include?(photo)
      url = remove_photo_path(photo)
      options[:method] = :delete
      options[:class] += " add-to-favourites add-to-favourites-active"
      link_text = "Unfavourite this work"
    elsif current_user
      url = add_photo_path(photo)
      options[:method] = :post
      options[:class] += " add-to-favourites"
      link_text = "Favourite this work"
    end
    link_to link_text, url, options
  end
end