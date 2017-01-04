FactoryGirl.define do
  factory :user do
    first_name "MyString"
    sequence :email do |n|
       "name#{n}@example.com"
    end
    password "MyString"
  end
end
