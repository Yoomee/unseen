module HomeHelper
  
  def next_home_background_class
    "home_bg_#{home_background_numbers.pop}"
  end
  
  private
  def home_background_numbers
    @home_background_numbers ||= (1..5).to_a.shuffle
  end
  
end