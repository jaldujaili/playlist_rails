require 'spec_helper'

describe Song do
  before {@song = FactoryGirl.build(:song)}

  subject {@song}

  it { is_expected.to respond_to(:title)}
  it { is_expected.to respond_to(:length)}
  it { is_expected.to respond_to(:genre)}

  it {is_expected.to belong_to(:artist)}
  it {is_expected.to have_many(:playlist_songs)}
  it {is_expected.to have_many(:playlists).through(:playlist_songs)}
  it {is_expected.to belong_to(:album)}
  end