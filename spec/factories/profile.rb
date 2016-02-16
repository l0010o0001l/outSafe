FactoryGirl.define do
  factory :host_profile do
    id 666
    fname Faker::Name.first_name
    lname Faker::Name.last_name
    username "avocado-dreaming"
    location "391 SW Park St. Portland, OR 97205"
    gender "Male"
    about "Love avocados, duh."
    host true
    guest false
    user
  end

  factory :guest_profile do
    id 667
    fname Faker::Name.first_name
    lname Faker::Name.last_name
    username "blueberry-dreaming"
    location "4923 SW Overton St. Portland, OR 97205"
    gender "Female"
    about "Love blueberries, duh."
    host false
    guest true
    user
  end

  factory :god_profile do
    id 668
    fname Faker::Name.first_name
    lname Faker::Name.last_name
    username "godly-dreaming"
    location "64272 SW Heaven St. Portland, OR 97205"
    gender "Female"
    about "Love fish and wine, duh."
    host true
    guest true
    user
  end
end
