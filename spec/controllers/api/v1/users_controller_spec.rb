require 'spec_helper'

describe Api::V1::UsersController, type: :controller do

  let(:current_user) {FactoryGirl.create :user}

  before do
    allow(controller).to receive(:require_user) { true }
    allow(controller).to receive(:current_user) { current_user }
  end


  describe "GET #show" do
    before(:each) do
      @user = FactoryGirl.create :user
      @user.update_attribute(:auth_token, "id_#{@user.id}")
      @request.env["HTTP_AUTHORIZATION"] = "Token token=#{@user.auth_token}"

      get :show, id: current_user.id, format: :json
    end

    it "returns the information about a reporter on a hash" do
      expect(json_response[:email]).to eql current_user.email
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do
    context "when is successfully created" do
      before(:each) do
        @user_attributes = FactoryGirl.attributes_for(:user)
        post :create, { user: @user_attributes }, format: :json
      end

      it "renders the json representation for the user record just created" do
        expect(json_response[:email]).to eql @user_attributes[:email]
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        @invalid_user_attributes = { email: "yes@gmail.com" }
        post :create, { user: @invalid_user_attributes },
             format: :json

      end
      it "renders an error json" do
        expect(json_response[:user]).to have_key(:errors)
      end
      it "renders the json errors on when the user could not be created" do
        expect(json_response[:user][:errors][:password]).to include "can't be blank"
      end
      it {should respond_with 422}
    end
  end

  describe "PUT/PATCH #update" do
    before(:each) do
      @user = FactoryGirl.create :user
      @user.update_attribute(:auth_token, "id_#{@user.id}")
      @request.env["HTTP_AUTHORIZATION"] = "Token token=#{@user.auth_token}"

      api_authorization_header @user.auth_token
    end

    context "when is successfully updated" do
      before(:each) do
        patch :update, { id: @user.id, user: {email: "someemail@example.com"}}, format: :json
      end

      it "renders the json represent for updated user" do
        expect(json_response[:email]).to eql "someemail@example.com"
      end
      it {should respond_with 200}
    end

    context "when is not updated" do
      before(:each) do
        @user = FactoryGirl.create :user
        @user.update_attributes(:auth_token, "id_#{@user.id}")
        @request.env["HTTP_AUTHORIZATION"] = "Token token=#{@user.auth_token}"

        patch :update, { id: @user.id, user: {email: "noemail.com"}}, format: :json
      end
      it "renders an error json" do
        expect(json_response[:email]).to have_key(:errors)
      end

      it "renders the json error when it could not be updated" do
        expect(json_response[:user][:errors][:email]).to include "is invalid"
      end

      it {should respond with 422}
  end

  describe "DELETE #destroy"do
    before :each do
      @user = FactoryGirl.create :user
      @user.update_attribute(:auth_token, "id_#{@user.id}")
      @request.env["HTTP_AUTHORIZATION"] = "Token token=#{@user.auth_token}"

      api_authorization_header @user.auth_token
    end
    it "deletes the user"do
      expect{delete :destroy, user_id: @user.id, format: :json}.to change(User, :count).by(-1)
      expect(response.status).to be_equal(204)
      end
    end
  end
end
