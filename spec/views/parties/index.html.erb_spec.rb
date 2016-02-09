require 'rails_helper'

RSpec.describe "parties/index", type: :view do
  before(:each) do
    assign(:parties, [
      Party.create!(
        :title => "Title",
        :address => "Address",
        :min_age => 1
      )
    ])
  end

  it "renders a list of parties" do
    render
    assert_select "h4.title", :text => "Title".to_s, :count => 1
    assert_select "p.address", :text => "Address".to_s, :count => 1
    assert_select "p.age", :integer => "Min_Age", :count => 1
  end
end
