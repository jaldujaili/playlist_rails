require 'spec_helper'
describe Api::V1::PlaylistsController, type: :controller do

  let(:current_user) {FactoryGirl.create :user}

  before do
    allow(controller).to receive(:require_user) { true }
    allow(controller).to receive(:current_user) { current_user }
  end

  describe "GET #index" do
    before(:each) do
      @user = FactoryGirl.create :user
      @playlist = FactoryGirl.create_list :playlist, 4, user_id: current_user.id

      get :index, user_id: current_user.id, format: :json
    end

    it "should belong to current user" do
      json_response.each { |playlist| expect(playlist[:user_id]).to eq(current_user.id) }
    end


    it {should respond_with 200}
  end

  describe "GET #show" do
    before(:each) do
      @user = FactoryGirl.create :user
      @playlist = FactoryGirl.create :playlist

      get :show, user_id: current_user, id: @playlist, format: :json
    end
    it "returns the information" do
      expect(json_response[:id]).to eql @playlist.id
    end
  end
  describe "POST #create" do
    context "when is successfully created" do
      before(:each) do
        @user = FactoryGirl.create :user
        @playlist_attributes = FactoryGirl.attributes_for(:playlist)
        @user.update_attribute(:auth_token, "id_#{@user.id}")
        @request.env["HTTP_AUTHORIZATION"] = "Token token=#{@user.auth_token}"

        api_authorization_header @user.auth_token
        post :create, user_id: @user.id, playlist: @playlist_attributes, format: :json
      end

      it "renders json when playlist created" do
        expect(json_response.count).to eql(5)
      end
      it {should respond_with 201}
    end


  context "when is not created" do
    before(:each) do
      @user = FactoryGirl.create :user
      @user.update_attribute(:auth_token, "id_#{@user.id}")
      @request.env["HTTP_AUTHORIZATION"] = "Token token=#{@user.auth_token}"

      @invalid_playlist_attributes = { title: ""}
      post :create, playlist: @invalid_playlist_attributes, user_id: @user.id, format: :json
    end

    it "renders an errors json" do
      expect(json_response[:playlist]).to have_key(:errors)
    end

    it "renders an error when the playlist could nto be created" do
      expect(json_response[:playlist][:errors][:title]).to eql ["can't be blank"]
    end

    it {should respond_with 422}
  end
end

describe "PUT/PATCH #update" do
    before(:each) do
      @playlist = FactoryGirl.create :playlist
      @user = FactoryGirl.create :user
      @user.update_attribute(:auth_token, "id_#{@user.id}")
      @request.env["HTTP_AUTHORIZATION"] = "Token token=#{@user.auth_token}"

      api_authorization_header @user.auth_token
    end
    context "when is successfully updated" do
      it "renders the json representation for the updated playlist" do
        expect(@playlist.title).to_not eq("5")

        patch :update, id: @playlist.id, user_id: @user.id,
              playlist: { title: "5" }, format: :json

        playlist_response= json_response
        expect(playlist_response[:title]).to eq("5")
        expect(response.code).to eq '200'
      end
    end

    context "when doesn't exist" do
      before(:each) do
        @user = FactoryGirl.create :user
        @user.update_attribute(:auth_token, "id_#{@user.id}")
        @request.env["HTTP_AUTHORIZATION"] = "Token token=#{@user.auth_token}"
      end

      it "renders an errors json" do
        expect{
          patch :update, id: 123456, user_id: @user.id,
                playlist: { title: 100 }, format: :json
        }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
  describe 'DELETE #destroy' do
    before :each do
      @playlist = FactoryGirl.create :playlist
      @user = FactoryGirl.create :user
      @user.update_attribute(:auth_token, "id_#{@user.id}")
      @request.env["HTTP_AUTHORIZATION"] = "Token token=#{@user.auth_token}"

      api_authorization_header @user.auth_token
    end
    it "deletes the playlist" do
      expect{ delete :destroy, user_id: current_user,
                     id: @playlist.id, format: :json}.to change(Playlist,:count).by(-1)
      expect(response.status).to be_equal(204)
    end
  end
end

