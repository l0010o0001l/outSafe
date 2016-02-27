require "rails_helper"

RSpec.describe User, :type => :model do

  let(:user) { FactoryGirl.create :user }
  let(:profile_count) { Profile.count }

end
