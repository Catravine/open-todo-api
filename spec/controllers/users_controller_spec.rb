require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:new_user_attributes) do
     {
         username: "BlocHead",
         email: "blochead@bloc.io",
         password: "blochead",
         password_confirmation: "blochead"
     }
   end

   describe "GET new" do
     it "instantiates a new user" do
       get :new
       expect(assigns(:user)).to_not be_nil
     end
   end

   describe "POST create" do
     it "creates a new user" do
       expect{
         post :create, user: new_user_attributes
       }.to change(User, :count).by(1)
     end
   end

end
