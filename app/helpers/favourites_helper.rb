module FavouritesHelper
  
  def favourite_link(resource, options ={})
    # return "" if current_user.nil?
    options.merge!(:remote => true, :"data-resource-type" => resource.class.to_s, :"data-resource-id" => resource.id)
    options[:class] = "#{options[:class]} favourite-btn tooltip-bottom"
    photo_or_slide = resource.is_a?(Photo) || resource.is_a?(Slide)    
    if photo_or_slide
      options[:class] += " add-to-collection"
    else
      options[:class] += " black-btn mt-1 pull-left"
    end
    if current_user
      if favourite = current_user.favourites.where(:resource_type => resource.class.to_s, :resource_id => resource.id).first
        url = favourite
        options[:title] = photo_or_slide ? "Remove from collection" : "REMOVE FROM MY FAVOURITES"
        options[:method] = :delete
        options[:class] += photo_or_slide ? " add-to-collection-active" : " active"      
      elsif current_user
        url = create_favourite_path(:favourite => {:resource_type => resource.class.to_s, :resource_id => resource.id})
        options[:title] = photo_or_slide ? "Add to collection" : "ADD TO MY FAVOURITES"
        options[:method] = :post
      end
    else
      url = sign_in_path
      options[:title] = photo_or_slide ? "Log in or register to add to collection" : "LOG IN OR REGISTER TO ADD TO MY FAVOURITES"
      options[:remote] = false
    end
    link_to(url, options) do
      content_tag(:i, "", :class => "icon-heart") + (photo_or_slide ? '' : " Favourite")
    end
  end

end
