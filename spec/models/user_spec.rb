require 'spec_helper'

describe User do
  before {@user = FactoryGirl.build(:user)}

  subject {@user}


  it { is_expected.to respond_to(:email)}
  it { is_expected.to respond_to(:password)}
  it { is_expected.to respond_to(:password_confirmation)}
  it { is_expected.to respond_to(:auth_token)}


  it {is_expected.to be_valid}

  it {is_expected.to have_many(:playlists)}
  it {is_expected.to have_many(:albums)}
  it {is_expected.to have_many(:artists)}
  it {is_expected.to have_many(:songs)}



  describe "#generate_authentication_token!" do
    it "generates a unique token" do
      Devise.stub(:friendly_token).and_return("auniquetoken123")
      @user.send(:generate_authentication_token!)
      expect(@user.auth_token).to eql "auniquetoken123"
    end

    it "generates another token when one already has been taken" do
      existing_user = FactoryGirl.create(:user, auth_token: "auniquetoken123")
      @user.generate_authentication_token!
      expect(@user.auth_token).not_to eql existing_user.auth_token
    end
  end
end