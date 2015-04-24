require 'spec_helper'
describe Api::V1::ArtistsController, type: :controller do
  let(:current_user) {FactoryGirl.create :user}

  before do
    allow(controller).to receive(:require_user) { true }
    allow(controller).to receive(:current_user) { current_user }
  end

  describe "GET #show"do
    before(:each) do
      @artist = FactoryGirl.create :artist
      @playlist = FactoryGirl.create :playlist
      @user = FactoryGirl.create :user
      get :show, id: @artist, playlist_id: @playlist.id, user_id: @user.id, format: :json
    end
    it "return info on a hash" do
      expect(json_response[:name]).to eql @artist.name
    end
    it {should respond_with 200}
  end
  describe "GET #index"do
    before(:each) do
      @artist = FactoryGirl.create_list :artist, 4
      @playlist = FactoryGirl.create :playlist
      @user = FactoryGirl.create :user
      get :index, id: @artist, playlist_id: @playlist.id, user_id: @user.id, format: :json
    end
    it "returns record from database" do
      expect(json_response.count).to eql(4)
    end
    it {should respond_with 200}
  end
end