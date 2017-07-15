require 'rails_helper'

RSpec.describe GroupUser, type: :model do
	describe "associations" do
		it { should belong_to(:user) }
		it { should belong_to(:group) }
	end
end
