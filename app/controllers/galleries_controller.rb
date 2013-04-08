class GalleriesController < ApplicationController

  expose(:gallery) do
    gallery = Page.find_by_id(params[:id]) || User.new
    gallery
  end


  def index
    if params[:edition]
      @page = Page.find_by_view_name_and_edition(:galleries, params[:edition])
      @page_children = @page.children.order("title")
      render :template => "pages/views/#{@page.view_name}"
    end
  end
  
  def clone
    clone = gallery.create_gallery_clone(User::LATEST_EDITION)
    flash[:notice] = "Created a copy of #{clone} for #{clone.edition}"
    return_or_redirect_to(page_path(clone))
  end

end