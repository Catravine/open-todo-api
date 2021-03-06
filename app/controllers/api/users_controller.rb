class Api::UsersController < ApiController

  def index
    users = User.all
    render json: users, each_serializer: UserSerializer
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    if user && user.destroy
      render json: {}, status: :no_content
    else
      render json: {}, status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
