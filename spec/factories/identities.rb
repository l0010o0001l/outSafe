FactoryGirl.define do
  factory :identity do
    association user
    provider "facebook"
    uid "48219587"
  end
end
