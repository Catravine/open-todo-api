require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:my_user) { create(:user, name: "Blochead", email: "blochead@bloc.io", password: "password") }

  describe "POST sessions" do
    it "initializes a session" do
      post :create, session: {email: my_user.email, password: my_user.password}
      expect(session[:user_id]).to eq my_user.id
    end

    it "does not add a user id to session due to missing password" do
      post :create, session: {email: my_user.email}
      expect(session[:user_id]).to be_nil
    end
  end

  describe "DELETE sessions/id" do
     it "deletes the user's session" do
       delete :destroy, id: my_user.id
       expect(assigns(:session)).to be_nil
     end
   end
end
