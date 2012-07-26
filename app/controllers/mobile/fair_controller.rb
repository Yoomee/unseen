class Mobile::FairController < MobileController
  
  def index
    @page_title = "Fair & Festival"
    @items = [
      ["Full Programe", mobile_program_path],
      ["Galleries", 'javascript:void(0);'],
      ["Photographers", 'javascript:void(0);'],
      ["Fair & Festival map", 'javascript:void(0);'],
      ["Location", 'javascript:void(0);'],
      ["Amsterdam", 'javascript:void(0);']
    ]
  end
  
end