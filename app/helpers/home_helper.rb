module HomeHelper
  
  def next_home_background_class
    "home_bg_#{home_background_numbers.pop}"
  end
  
  private
  def home_background_numbers
    return @home_background_numbers if @home_background_numbers
    @home_background_numbers = (1..5).to_a.shuffle
    @home_background_numbers.pop if @home_background_numbers.last == 5
    @home_background_numbers
  end
  
end