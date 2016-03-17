require 'rails_helper'

 RSpec.describe User, type: :model do
   let(:user) { create(:user) }

   it { should have_many(:lists) }

   describe "attributes" do
     it "should respond to username" do
       expect(user).to respond_to(:username)
     end

     it "should respond to email" do
       expect(user).to respond_to(:email)
     end
   end

   describe "invalid user" do
     let(:user_with_invalid_name) { User.new(username: "", email: "user@bloccit.com") }
     let(:user_with_invalid_email) { User.new(username: "Bloccit User", email: "") }

     it "should be an invalid user due to blank name" do
       expect(user_with_invalid_name).to_not be_valid
     end

     it "should be an invalid user due to blank email" do
       expect(user_with_invalid_email).to_not be_valid
     end

   end
 end
