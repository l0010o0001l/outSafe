require 'rails_helper'

RSpec.describe "parties/edit", type: :view do
  before(:each) do
    @party = assign(:party, Party.create!(
      :title => "MyString",
      :address => "MyString",
      :min_age => 1
    ))
  end

  it "renders the edit party form" do
    render

    assert_select "form[action=?][method=?]", party_path(@party), "post" do

      assert_select "input#party_title[name=?]", "party[title]"

      assert_select "input#party_address[name=?]", "party[address]"

      assert_select "input#party_min_age[name=?]", "party[min_age]"
    end
  end
end
