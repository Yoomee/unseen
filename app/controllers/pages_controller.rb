class PagesController < ApplicationController
  
  include YmCms::PagesController
  
  expose(:page_children) do
    if page
      page.slug=="news" ? page.children.order("created_at DESC") : page.children
    else
      Page.scoped
    end
  end
  
end
