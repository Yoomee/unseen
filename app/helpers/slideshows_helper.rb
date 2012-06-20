module SlideshowsHelper
  
  def home_slide_class(slide_num)
    case slide_num
    when 0
      'home-slide-prev'
    when 1
      'home-slide-active'
    when 2
      'home-slide-next'
    end
  end
  
end