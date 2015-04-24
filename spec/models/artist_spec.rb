require 'spec_helper'

describe Artist do
  before {@artist = FactoryGirl.build(:artist)}

  subject {@artist}

  it {is_expected.to respond_to(:name)}
  it {is_expected.to have_many(:songs)}
  it {is_expected.to have_many(:albums)}
  end