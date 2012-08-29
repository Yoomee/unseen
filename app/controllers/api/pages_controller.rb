class Api::PagesController < ApplicationController
  
  def index
    case params[:version].to_i || 1
    when 2
      render :json => Page.find_by_slug('news').children.to_json(:only => [:id, :title, :text], :methods => [:image_url_for_api,:image_height_for_api])
    else
      render :json => []
    end
  end
  
  
end