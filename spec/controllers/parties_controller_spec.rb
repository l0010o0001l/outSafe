require 'rails_helper'

RSpec.describe PartiesController, type: :controller do
  include Devise::TestHelpers

  let(:current_user) { FactoryGirl.build_stubbed :user }
  let(:party) { FactoryGirl.build_stubbed :party }

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

    describe "GET #show" do
      it "returns a 200 status code" do
        expect(response.status).to eq 200
      end
    end
  end

  context "success" do
    describe "GET #edit" do
      it "returns a 200 status code" do
        expect(response.status).to eq 200
      end
    end
  end

  describe "POST #create" do
    before do
      subject { POST :create, party_params }
    end

    context "success" do
      it "redirects to the created party" do
        expect(response.status).to eq 200
      end
    end

    context "failure" do
      it "redirects to new party form" do
        expect(response.status).to eq 200
      end
    end
  end

  describe "PUT #update" do
    before do
      subject { PUT :update, party_params }
    end

    context "success" do
      it "redirects to the updated party" do
        expect(response.status).to eq 200
      end
    end

    context "failure" do
      it "redirects to the edit page" do
        # expect(subject).to redirect_to :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "redirects to parties" do
      # expect(subject).to redirect_to parties_url
    end
  end

end
