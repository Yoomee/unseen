class CallToActionsController < ApplicationController
  load_and_authorize_resource
  def create
    if @call_to_action.save
      flash_notice(@call_to_action)
      redirect_to @call_to_action
    else
      render :action => "new"
    end
  end
  
  def destroy
    @call_to_action.destroy
    flash_notice(@call_to_action)
    redirect_to call_to_actions_path
  end
  
  def update
    if @call_to_action.update_attributes(params[:call_to_action])
      flash_notice(@call_to_action)
      redirect_to @call_to_action
    else
      render :action => "edit"
    end
  end
  
end