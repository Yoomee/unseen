module FairHelper
  
  def next_fair_background_class
    "fair_bg_#{fair_background_numbers.pop}"
  end
  
  private
  def fair_background_numbers
    # Currently, the logic is the same as the homepage
    home_background_numbers
  end
  
end