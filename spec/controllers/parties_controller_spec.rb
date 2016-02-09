require 'rails_helper'

RSpec.describe PartiesController, type: :controller do
  include Devise::TestHelpers

  let(:valid_attributes) {
    skip("")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all parties as @parties" do
      party = Party.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:parties)).to eq([party])
    end
  end

  describe "GET #show" do
    it "assigns the requested party as @party" do
      party = Party.create! valid_attributes
      get :show, {:id => party.to_param}, valid_session
      expect(assigns(:party)).to eq(party)
    end
  end

  describe "GET #new" do
    it "assigns a new party as @party" do
      helper.stub(:current_user).and_return(user)
      user.profile.host == true
      get :new, {}, valid_attributes
      expect(assigns(:party)).to be_a_new(Party)
    end
  end

  describe "GET #edit" do
    it "assigns the requested party as @party" do
      party = Party.create! valid_attributes
      get :edit, {:id => party.to_param}, valid_session
      expect(assigns(:party)).to eq(party)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Party" do
        expect {
          post :create, {:party => valid_attributes}, valid_session
        }.to change(Party, :count).by(1)
      end

      it "assigns a newly created party as @party" do
        post :create, {:party => valid_attributes}, valid_session
        expect(assigns(:party)).to be_a(Party)
        expect(assigns(:party)).to be_persisted
      end

      it "redirects to the created party" do
        post :create, {:party => valid_attributes}, valid_session
        expect(response).to redirect_to(Party.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved party as @party" do
        post :create, {:party => invalid_attributes}, valid_session
        expect(assigns(:party)).to be_a_new(Party)
      end

      it "re-renders the 'new' template" do
        post :create, {:party => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested party" do
        party = Party.create! valid_attributes
        put :update, {:id => party.to_param, :party => new_attributes}, valid_session
        party.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested party as @party" do
        party = Party.create! valid_attributes
        put :update, {:id => party.to_param, :party => valid_attributes}, valid_session
        expect(assigns(:party)).to eq(party)
      end

      it "redirects to the party" do
        party = Party.create! valid_attributes
        put :update, {:id => party.to_param, :party => valid_attributes}, valid_session
        expect(response).to redirect_to(party)
      end
    end

    context "with invalid params" do
      it "assigns the party as @party" do
        party = Party.create! valid_attributes
        put :update, {:id => party.to_param, :party => invalid_attributes}, valid_session
        expect(assigns(:party)).to eq(party)
      end

      it "re-renders the 'edit' template" do
        party = Party.create! valid_attributes
        put :update, {:id => party.to_param, :party => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested party" do
      party = Party.create! valid_attributes
      expect {
        delete :destroy, {:id => party.to_param}, valid_session
      }.to change(Party, :count).by(-1)
    end

    it "redirects to the parties list" do
      party = Party.create! valid_attributes
      delete :destroy, {:id => party.to_param}, valid_session
      expect(response).to redirect_to(parties_url)
    end
  end

end
