Factory.define :page do |f|  
  f.title "Page title"
  f.text "Nunc eu ullamcorper orci. Quisque eget odio ac lectus vestibulum faucibus eget in metus. In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus tortor. Nulla facilisi."  
  f.published true
end

Factory.define :snippet do |f|  
  f.name "test_snippet"
  f.text "Nunc eu ullamcorper orci. Quisque eget odio ac lectus vestibulum faucibus eget in metus. In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus tortor. Nulla facilisi."  
end

Factory.define :slideshow do |f|
  f.association :attachable, :factory => :page
end

Factory.define :slide do |f|
  f.association :slideshow
  f.sequence(:caption) {|n| "Slide caption #{n}"}
  f.sequence(:position)
  f.after_build do |slide|
    image_mock = f.double('image_mock')
    image_mock.stub(:size => 100.kilobytes)
    image_mock.stub(:mime_type => 'image/png')
    image_mock.stub(:url => '/url/to/image.png')
    image_mock.stub(:process => image_mock)
    slide.stub(:image => image_mock)
  end
end

Factory.define :user do |f|
  f.first_name "Charles"
  f.last_name "Barrett"
  f.email "charles@barrett.com"
  f.password "password"
end