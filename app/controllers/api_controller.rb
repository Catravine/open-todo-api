class ApiController < ApplicationController

  include Knock::Authenticable
  skip_before_action :verify_authenticity_token

  before_filter :authenticate
  #before_action :authenticated?

  private

  def authenticated?
    authenticate_or_request_with_http_basic do |username, password|
      #@user = User.find_by_name(params[:name])
      #@user && @user.authenticate(params[:password])
      username == "Caroline" && password == "helloworld"
    end
  end
end
