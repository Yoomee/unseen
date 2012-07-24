class MobileController < ApplicationController
  
  layout 'mobile'
  
  before_filter :set_retina
  
  private
  def set_retina
    @retina = request.env["HTTP_SCREEN_SCALE"] == "2.0"
    if Rails.env.development?
      @retina = @retina || params[:retina].present?
    end
  end
    
end