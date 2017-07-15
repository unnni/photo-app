require 'rails_helper'

RSpec.describe Group, type: :model do
	describe "associations" do
		it { should belong_to(:user) }
		it { should have_many(:group_userships).class_name('User').through(:group_users)}

	end
end
