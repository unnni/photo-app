require 'rails_helper'

describe 'visitor registers for the site', :type => :feature do
	let (:user) { FactoryGirl.create(:user) }
	it 'visitor registers' do	
		visit root_path
		expect(page).to have_text("Welcome to the Photo App")
		click_link "Share photos now!"
		fill_in_registration_fields
		expect(page).to have_content("Welcome! You have signed up successfully.")
	end

	def fill_in_registration_fields
		fill_in "user[first_name]", with: Faker::Name.first_name
		fill_in "user[last_name]",with: Faker::Name.last_name
		fill_in "user[email]",with: Faker::Internet.email
		password = Devise.friendly_token.first(8)
		fill_in "user[password]", with: password
		fill_in "user[password_confirmation]", with: password
		click_button "Sign up"
	end
end