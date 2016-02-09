require 'test_helper'

class PartyTest < ActiveSupport::TestCase
  def setup
    @party = party(:test_party)
  end

  test "user_id should be present" do
    assert @party.user_id.present?
  end

end
