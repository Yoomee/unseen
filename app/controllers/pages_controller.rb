class PagesController < ApplicationController
  
  include YmCms::PagesController
  load_and_authorize_resource
  
  expose(:page_children) do
    if page
      page.slug=="news" ? page.children.order("created_at DESC") : page.children
    else
      Page.scoped
    end
  end

  def new
    page.parent_id = params[:parent_id]
    if page.parent.try(:slug) == "galleries"
      page.view_name = "gallery"
    end
  end
  
end
