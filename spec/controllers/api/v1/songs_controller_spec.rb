require 'spec_helper'
describe Api::V1::SongsController, type: :controller do
  let(:current_user) {FactoryGirl.create :user}

  before do
    allow(controller).to receive(:require_user) { true }
    allow(controller).to receive(:current_user) { current_user }
  end

  describe "GET #show"do
    before(:each) do

    end
    it "return info on a hash" do

    end
    it {should respond_with 200}
  end
  describe "GET #index"do
    before(:each) do

    end
    it "returns record from database" do

    end
    it {should respond_with 201}
  end


  describe "POST #create"do
    context "when created" do
      before(:each) do

      end
      it "renders the json just created" do

      end
      it {should respond_with 201}
    end
    context "when not created" do
      before(:each) do

      end
    end
  end

  describe "PUT/PATCH #update"do
    before(:each) do

    end
  end
  describe "DELETE #delete"do
    before(:each) do

    end
  end

end