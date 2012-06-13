class SlideshowsController < ApplicationController
  
  include YmCms::SlideshowsController
  load_and_authorize_resource
  
end
