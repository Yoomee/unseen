class Api::PhotographersController < ApplicationController
  
  def index
    case params[:version]
    when "2013"
      render :json => User.where(:role => 'photographer', :edition => params[:version]).to_json(:only => [:id, :bio], :methods => [:full_name, :image_url_for_api], :include => {:photos => {:only => [:id, :caption], :methods => [:image_url_for_api]}})
    when "2"
      render :json => User.where(:role => 'photographer', :edition => '2012').to_json(:only => [:id, :bio], :methods => [:full_name, :image_url_for_api], :include => {:photos => {:only => [:id, :caption], :methods => [:image_url_for_api]}})
    else
      render :json => User.where(:role => 'photographer', :edition => '2012').to_json(:only => [:id, :bio], :methods => [:full_name])
    end
  end
  
end