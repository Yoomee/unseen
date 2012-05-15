FactoryGirl.define do
  
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