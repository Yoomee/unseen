class SearchesController < ApplicationController
  
#  load_and_authorize_resource
  
  def show
     @results = params[:q].present? ? ThinkingSphinx.search(params[:q]) : []
  end
  
end
