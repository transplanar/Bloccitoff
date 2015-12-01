require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  #   let(:comment) { Comment.create!(body: 'Comment Body', post: post, user: user) }
  # let(:user){User.create()}
  let(:item) {name: "TestItemName"}

  # describe "attributes" do
  #   it "responds to name" do
  #     expect()
  #   end
  # end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
