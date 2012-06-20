desc "Do stuff after deploy"
task :after_deploy => :environment do
  unless Slideshow.find_by_slug('homepage')
    Slideshow.create(:slug => 'homepage')
    persona_parent = Page.create(:title => "Persona pages", :slug => "persona_pages", :view_name => 'list')
    ['Public', 'Collectors', 'First-time buyers', 'Professionals', 'VIP', 'Press'].each do |title|
      persona_parent.children.create(:title => title, :permalink_path => (title == 'Press' ? 'for-press' : title.parameterize), :view_name => "persona_page", :published_at => Time.now)
    end
    Page.create(:title => 'Venues', :slug => 'venues', :permalink_path => 'venues', :view_name => 'list')
    amsterdam = Page.create(:title => 'Amsterdam', :permalink_path => 'amsterdam', :slug => 'amsterdam',:view_name => 'amsterdam', :published_at => Time.now)
    amsterdam.children.create(:title => 'Most recent', :published_at => Time.now)
  end
end
