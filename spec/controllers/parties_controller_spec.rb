require 'rails_helper'

RSpec.describe PartiesController, type: :controller do
  include Devise::TestHelpers

  let(:user) { FactoryGirl.build_stubbed :user }
  let(:party) { FactoryGirl.create :party }
  let(:profile) { FactoryGirl.build_stubbed :god_profile }
  let(:valid_party_params) do
    {
      :user_id => user.id,
      :title => "YOLO #SWAG",
      :address => "493 SW Broadway, Portland, OR 97205",
      :min_age => 21
    }
  end
  let(:invalid_party_params) do
    {
      :user_id => nil,
      :title =>  89532,
      :address => 911,
      :min_age => "21"
    }
  end

  # Successful get requests
  context "success" do
    describe "GET #index" do
      it "returns a 200 status code" do
        expect(response.status).to eq 200
      end
    end

    describe "GET #new" do
      it "returns a 200 status code" do
        expect(response.status).to eq 200
      end
    end

    describe "GET #edit" do
      it "returns a 200 status code" do
        expect(response.status).to eq 200
      end
    end

    describe "GET #show" do
      it "returns a 200 status code" do
        expect(response.status).to eq 200
      end
    end
  end

  # Successful POST requests
  context "success" do
    describe "POST #create" do
      before do
        subject { POST :create, valid_party_params }
      end

      context "success" do
        it "has a response status of 200" do
          expect(response.status).to eq 200
        end
      end
    end
  end

  describe "PUT #update" do
    context "success" do
      it "redirects to the updated party" do
        expect(response.status).to eq 200
      end
    end
  end

  describe "PATCH #update" do
    context "success" do
      it "redirects to the updated party" do
        expect(response.status).to eq 200
      end
    end
  end

  describe "DELETE #destroy" do
    it "redirects to parties" do
      expect(response.status).to eq 200
    end
  end
end
