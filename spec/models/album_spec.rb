require 'spec_helper'

describe Album do
  before {@album = FactoryGirl.build(:album)}

  subject {@album}

  it {is_expected.to respond_to(:title)}
  it {is_expected.to have_many(:songs)}
  it {is_expected.to belong_to(:playlist)}
  it {is_expected.to belong_to(:artist)}

  end