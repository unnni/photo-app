require 'rails_helper'

RSpec.describe User,type: :model do
	describe "associations" do
      it { should have_many(:albums) }
      it { should have_many(:groups) }
  	  it { should have_many(:group_userships).class_name('Group').through(:group_users) }
  end 	
end