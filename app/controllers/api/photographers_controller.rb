class Api::PhotographersController < ApplicationController
  
  def index
    render :json => User.where(:role => 'photographer').to_json(:only => [:id, :bio], :methods => [:full_name, :image_url_for_api], :include => {:photos => {:only => [:id, :caption], :methods => [:image_url_for_api]}})
  end
  
end