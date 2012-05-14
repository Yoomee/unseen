module UrlHelper
  
  def user_path(*args)
    options = args.extract_options!
    user = args.first
    if user.photographer?
      photographer_path(user, options)
    else
      super
    end
  end 
  
  def edit_user_path(*args)
    options = args.extract_options!
    user = args.first
    if user.photographer?
      edit_photographer_path(user, options)
    else
      super
    end
  end
  
end