require 'rails_helper'
	
	describe "user gets to manage account" do
		before do
			@user = FactoryGirl.create(:user)
		end	

		it 'shows sign in link if user not signed in' do
			visit root_path
			expect(page).to have_link("Sign in")
		end

		it 'shows log out option if user signed in' do
			login_as(@user, :scope => :user)
			visit root_path
			expect(page).to have_link("Log out")
			click_link "Log out"
			expect(page).to have_content("Signed out successfully.")
		end

		it 'shows edit account option if user signed in' do
			login_as(@user, :scope => :user)
			visit root_path
			expect(page).to have_link("Edit account")
			click_link "Edit account"
			expect(page).to have_button("Cancel my account")
		end
	end
