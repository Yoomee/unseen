class PagesController < ApplicationController

  include YmCms::PagesController
  load_and_authorize_resource

  expose(:amsterdam_page) {Page.find_by_slug('amsterdam')}
  expose(:press_page) {Page.find_by_slug('press')}

  def new
    @page.parent_id = params[:parent_id]
    @page.publication_date = Time.now
    if @page.parent.try(:slug) == "galleries"
      @page.view_name = "gallery"
    elsif @page.parent.try(:slug) == "venues"
      @page.view_name = "gallery"
    elsif @page.parent.try(:slug) == "press"
      @page.view_name = "press_subpage"      
    elsif @page.parent.try(:slug) == "news"
      @page.view_name = "news"
    elsif @page.parent.try(:slug) == "welcome"
      @page.view_name = "highlight"
    elsif @page.parent.try(:slug) == "amsterdam"
      @page.view_name = "amsterdam"
    end
  end

  def set_view
    session[:view] = %w{list block}.include?(params[:view]) ? params[:view] : 'list'
    return_or_redirect_to(root_path)
  end

  def show
    set_page_children
    if @page.root.slug == 'amsterdam'
      render(:action => "views/amsterdam") and return
    elsif @page.slug == 'news'
      session[:news_category] = params[:category]   
    end
    render :action => "views/#{@page.view_name}"
  end

  private
  def set_page_children
    if @page
      if @page.slug == "news"
        children = @page.children.order("publication_date DESC, created_at DESC")
        @page_children = params[:category].present? ? children.tagged_with(params[:category], :on => 'categories').uniq : children
      elsif @page.slug == "galleries"
        @page_children = @page.children.order("title")
      else
        @page_children = @page.children
      end
    else
      @page_children = Page.scoped
    end
  end

end
