require 'rails_helper'

describe 'visitors sees homepage' do
	it 'direct to home path' do
		visit root_path
		expect(page).to have_content "Welcome to the Photo App"
	end

end