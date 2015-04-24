require 'spec_helper'

describe Playlist do
  before {@playlist = FactoryGirl.build(:playlist)}

  subject {@playlist}

  it {is_expected.to respond_to(:title)}
  it {is_expected.to have_many(:artists)}
  it {is_expected.to have_many(:songs)}
  it {is_expected.to have_many(:albums). through(:artists)}
  it {is_expected.to belong_to(:user)}

it "must have title" do
  FactoryGirl.build(:playlist, :title =>"").should_not be_valid
end
  end