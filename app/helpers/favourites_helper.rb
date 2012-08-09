module FavouritesHelper
  
  def favourite_link(resource)
    return "" if current_user.nil?
    options = {:class => "black-btn favourite-btn mt-1 pull-left tooltip-bottom", :remote => true, :"data-resource-type" => resource.class.to_s, :"data-resource-id" => resource.id}
    if favourite = current_user.favourites.where(:resource_type => resource.class.to_s, :resource_id => resource.id).first
      url = favourite
      options.merge!(:method => :delete, :title => "REMOVE FROM MY FAVOURITES")
      options[:class] += " active"      
    else
      url = create_favourite_path(:favourite => {:resource_type => resource.class.to_s, :resource_id => resource.id})
      options.merge!(:method => :post, :title => "ADD TO MY FAVOURITES")
    end
    link_to(url, options) do
      content_tag(:i, "", :class => "icon-heart") + " Favourite"
    end
  end
  
end