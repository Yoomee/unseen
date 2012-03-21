class PagesController < ApplicationController
  
  include YmCms::PagesController
  load_and_authorize_resource
  
  expose(:page_children) do
    if page
      if page.slug == "news"
        page.children.order("created_at DESC")
      elsif page.slug == "galleries"
        page.children.order("title")
      else
        page.children
      end
    else
      Page.scoped
    end
  end

  def new
    page.parent_id = params[:parent_id]
    if page.parent.try(:slug) == "galleries"
      page.view_name = "gallery"
    elsif page.parent.try(:slug) == "news"
      page.view_name = "news"
    end
  end
  
end
