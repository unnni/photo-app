class Group < ApplicationRecord
  belongs_to :user
  has_many :group_users
  has_many :group_userships, class_name: 'User', through: :group_users

  accepts_nested_attributes_for :group_users

end
