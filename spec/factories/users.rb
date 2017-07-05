FactoryGirl.define do

  factory :user do
    first_name 'Gandalf'
    last_name 'The Grey'
    email 'gandalf@wizard.com'
    password 'youshallnotpass'
    password_confirmation 'youshallnotpass'
  end
  
end
