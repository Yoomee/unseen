FactoryGirl.define do
  
  factory :page do |f|  
    f.title "Page title"
    f.text "Nunc eu ullamcorper orci. Quisque eget odio ac lectus vestibulum faucibus eget in metus. In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus tortor. Nulla facilisi."  
    f.published_at Time.now
  end
  
  factory :user do |f|
    f.first_name "Charles"
    f.last_name "Barrett"
    f.email "charles@barrett.com"
    f.password "password"
  end
  
  factory :photo do |f|
    f.association :photographer, :factory => :user
    f.after_build do |photo|
      image_mock = f.double('image_mock')
      image_mock.stub(:size => 100.kilobytes)
      image_mock.stub(:format => :png)
      image_mock.stub(:mime_type => 'image/png')
      image_mock.stub(:url => '/url/to/image.png')
      image_mock.stub(:process => image_mock)
      photo.stub(:image => image_mock)
    end
  end
  
end