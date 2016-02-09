require 'rails_helper'

RSpec.describe "parties/show", type: :view do
  before(:each) do
    @party = assign(:party, Party.create!(
      :title => "Title",
      :address => "Address",
      :min_age => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/1/)
  end
end
