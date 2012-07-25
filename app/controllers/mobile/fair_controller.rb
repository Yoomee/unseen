class Mobile::FairController < MobileController
  
  def index
    @page_title = "Fair & Festival"
    @items = [
      ["Full Programe", '#'],
      ["Galleries", '#'],
      ["Photographers", '#'],
      ["Fair & Festival map", '#'],
      ["Location", '#'],
      ["Amsterdam", '#']
    ]
  end
  
end