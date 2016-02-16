FactoryGirl.define do
  factory :party do
    title "Insanely Authentic Coffee Meet"
    description "Wouldn't you like to know?"
    address "295 Upshire St. Portland, OR 97205"
    min_age 68
    association user
  end
end
