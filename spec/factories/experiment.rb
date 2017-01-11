FactoryGirl.define do
  factory :experiment do
    user
    title "MyString"
    hypothesis "MyString"
    description "MyString"
    minutes "5"
  end
end
