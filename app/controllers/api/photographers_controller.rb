class Api::PhotographersController < ApplicationController
  
  def index
    render :json => User.where(:role => 'photographer').to_json(:only => [:bio], :methods => [:full_name], :include => {:photos => {:only => [:id], :methods => [:square_image_url_for_api]}})
  end
  
end