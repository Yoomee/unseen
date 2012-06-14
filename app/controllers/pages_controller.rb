class PagesController < ApplicationController
  
  include YmCms::PagesController
  load_and_authorize_resource

  expose(:amsterdam_page) {Page.find_by_slug('amsterdam')}
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
    elsif page.parent.try(:slug) == "welcome"
      page.view_name = "highlight"
    elsif page.parent.try(:slug) == "amsterdam"
      page.view_name = "amsterdam"
    end
  end
  
end
