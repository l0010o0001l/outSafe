require 'rails_helper'

RSpec.describe Party, type: :model do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:min_age) }
end
