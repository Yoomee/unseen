class GalleriesController < ApplicationController

  def index
    if params[:edition]
      @page = Page.find_by_view_name_and_edition(:galleries, params[:edition])
      @page_children = @page.children.order("title")
      render :template => "pages/views/#{@page.view_name}"
    end
  end

end