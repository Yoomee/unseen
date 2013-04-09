class GalleriesController < ApplicationController

  expose(:gallery) do
    gallery = Page.find_by_id(params[:id]) || User.new
    gallery
  end
  
  def clone
    clone = gallery.create_gallery_clone(User::LATEST_EDITION)
    flash[:notice] = "Created a copy of #{clone} for #{clone.edition}"
    return_or_redirect_to(page_path(clone))
  end
  
  def index
    page = Page.find_by_view_name_and_edition(:galleries, CURRENT_EDITION)
    redirect_to page_path(page)
  end

end