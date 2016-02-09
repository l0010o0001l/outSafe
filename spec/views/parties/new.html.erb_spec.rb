require 'rails_helper'

RSpec.describe "parties/new", type: :view do
  before(:each) do
    assign(:party, Party.new(
      :title => "MyString",
      :address => "MyString",
      :min_age => 1
    ))
  end

  it "renders new party form" do
    render

    assert_select "form[action=?][method=?]", parties_path, "post" do

      assert_select "input#party_title[name=?]", "party[title]"

      assert_select "input#party_address[name=?]", "party[address]"

      assert_select "input#party_min_age[name=?]", "party[min_age]"
    end
  end
end
