class Api::PagesController < ApplicationController
  
  def index
    case params[:version].to_i || 1
    when 2
      pages = Page.find_by_slug(:news).children
      pages += Page.find_by_slug(:app_more).children
      pages += Page.find_by_slug(:mobile_explore).children
      render :json => pages.as_json(:only => [:id, :title, :text, :created_at, :publication_date, :parent_id], :methods => [:image_url_for_api,:image_height_for_api, :thumbnail_image_url_for_api])
    else
      render :json => []
    end
  end
  
  
end