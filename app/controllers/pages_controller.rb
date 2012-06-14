class PagesController < ApplicationController
  
  include YmCms::PagesController
  load_and_authorize_resource

  expose(:amsterdam_page) {Page.find_by_slug('amsterdam')}
  expose(:page_children) do
    if page
      if page.slug == "news"
        children = page.children.order("created_at DESC")
        params[:category].present? ? children.tagged_with(params[:category]) : children
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
  
  def set_view
    session[:view] = %w{list block}.include?(params[:view]) ? params[:view] : 'list'
    return_or_redirect_to(root_path)
  end
  
  def show
    if page.root.slug == 'amsterdam'
      render(:action => "views/amsterdam") and return
    elsif page.slug == 'news'
      session[:news_category] = params[:category]
    end
    render :action => "views/#{page.view_name}"
  end
  
end
