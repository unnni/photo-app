FactoryGirl.define do
  factory :image do
    title "MyString"
    date_taken Date.yesterday
    album_image { fixture_file_upload 'spec/fixtures/files/example_image.jpg', 'image/png'}
    album

  end
end
