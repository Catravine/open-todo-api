require 'rails_helper'

RSpec.describe ApiController, type: :controller do
  let(:my_user) { create(:user, name: "Blochead", email: "blochead@bloc.io", password: "password") }

end
