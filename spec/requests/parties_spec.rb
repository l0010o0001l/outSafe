require 'rails_helper'

RSpec.describe "Parties", type: :request do
  describe "GET /parties" do
    it "works!" do
      get parties_path
      expect(response).to have_http_status(:found)
    end
  end
end
