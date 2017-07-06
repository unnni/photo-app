require 'rails_helper'

describe 'user manages album' do
	#let!(:user) { FactoryGirl.create(:user) }
	before do
		@user = FactoryGirl.create(:user)
	end
	it 'user creates an album' do
		login_as(@user, scope: :user)

		visit root_path
		click_link "Dashboard"
		expect(page).to have_content("My Dashboard")

		click_link "Create New Album"
		expect(page).to have_content("Create a New Album")

		fill_in "album[title]", with: "New"
		click_button "Create Album"
		expect(page).to have_content("Album successfully created!")
		expect(page).to have_content("New")

		expect(Album.count).to eq 1
		album = Album.last
		expect(album).to have_attributes(
			title: "New",
			user_id: @user.id
		)
	end
end