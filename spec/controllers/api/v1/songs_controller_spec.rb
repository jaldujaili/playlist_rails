require 'spec_helper'
describe Api::V1::SongsController, type: :controller do
  let(:current_user) {FactoryGirl.create :user}

  before do
    allow(controller).to receive(:require_user) { true }
    allow(controller).to receive(:current_user) { current_user }
  end

  describe "GET #show"do
    before(:each) do
       @song = FactoryGirl.create :song
       @playlist = FactoryGirl.create :playlist
       @playlist_song = FactoryGirl.create :playlist_song
       @user = FactoryGirl.create :user

       get :show, id: @song, playlist_id: @playlist.id, playlist_song_id: @playlist_song.id, user_id: current_user.id, format: :json
    end
    it "return info on a hash" do
       expect(json_response[:title]).to eql @song.title
    end
    it {should respond_with 200}
  end
  describe "GET #index"do
    before(:each) do

      @playlist = FactoryGirl.create :playlist, user_id: current_user.id
      @song = FactoryGirl.create_list :song, 4
      @playlist_song = FactoryGirl.create_list :playlist_song, 4, playlist_id: @playlist.id


      get :index, playlist_id: @playlist.id, playlist_song_id: @playlist_song.first.id, user_id: current_user.id, format: :json
    end


    it "returns record from database" do
      expect(json_response.count).to eql(4)
    end
    it {should respond_with 200}
  end
end
