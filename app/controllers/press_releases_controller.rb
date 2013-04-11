class PressReleasesController < ApplicationController
  load_and_authorize_resource
  def create
    if @press_release.save
      redirect_to press_releases_path
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @press_release.destroy
    redirect_to press_releases_path
  end
  
  def show
    send_file @press_release.file.path, :filename => @press_release.file_name
  end
  
  def update
    if @press_release.update_attributes(params[:press_release])
      redirect_to press_releases_path
    else
      render :action => 'edit'
    end
  end
end