require 'rails_helper'

describe 'user manages group' do
	before do
		@user = FactoryGirl.create(:user)
	end

	it 'by creating a new group' do
		login_as(@user, scope: :user)
		visit root_path
		click_link "Dashboard"
		expect(page).to have_content("My Dashboard")

		click_link "Create New Group"
		expect(page).to have_content "Create a New Group!"

		fill_in "group[name]", with: "General"
		click_button "Create Group"

		expect(page).to have_content "Group successfully created"
		expect(page).to have_content "General"

		expect(Group.count).to eq 1

		group = Group.last
		expect(group).to have_attributes(
			name: "General",
			user_id: @user.id
		)
	end

end