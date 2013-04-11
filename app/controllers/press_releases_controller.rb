class PressReleasesController < ApplicationController
  load_and_authorize_resource
  def create
    if @press_release.save
      redirect_to press_releases_path
    else
      render :action => 'new'
    end
  end
  
  def show
    send_file @press_release.file.path, :filename => @press_release.file_name
  end
end