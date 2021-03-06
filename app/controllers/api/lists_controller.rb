class Api::ListsController < ApiController

  def index
    lists = List.all
    render json: lists, each_serializer: ListSerializer
  end

  def show
    list = List.find(params[:id])
    render json: list, each_serializer: ListSerializer
  end

  def create
    user = User.find(params[:user_id])
    list = user.lists.build(list_params)
    if list.save
      render json: list
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    list = List.find(params[:id])
    if list && list.destroy
      render json: {}, status: :no_content
    else
      render json: {}, status: :not_found
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :permission, :user)
  end

  def update_validation
    !self.non_public?
  end

end
