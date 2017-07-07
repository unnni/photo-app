require 'rails_helper'

describe 'user manages images' do
	before do
		#@user = FactoryGirl.create(:user)
		@album = FactoryGirl.create(:album)
	end

	it 'create a new image' do
		user = @album.user
		login_as(user, scope: :user)
		visit root_path
		click_link "Dashboard"
		expect(page).to have_content("My Dashboard")

		click_link "View Albums"
		expect(page).to have_content(@album.title)
		click_link "View Album"
		click_link "Add Image"

		image_path = 'spec/fixtures/files/example_image.jpg'
		attach_file "image[album_image]",image_path
		fill_in "image[title]", with: "New images"
		fill_in "image[date_taken]", with: Date.yesterday 
		click_button "Add Image"

		expect(page).to have_content("Image uploaded successfully!")
		expect(page).to have_content(@album.title)

		image = Image.last
		expect(image).to have_attributes(
			title: "New images",
			album_id: @album.id,
			date_taken: Date.yesterday,
			album_image_file_name: "example_image.jpg"
		)
	end

end