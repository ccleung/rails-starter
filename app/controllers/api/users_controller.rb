class Api::UsersController < Api::BaseController
  before_action :find_user, only: [:destroy, :show]

  def index
    render json: { index: '' }.to_json
  end

  def create
    binding.pry
    @user = User.create(user_params)
    if @user.valid?
      render json: @user
    else
      render json: { error: 'Unprocessable Entity' }.to_json, status: 422
    end
  end

  def destroy
    if @user && @user.destroy
      head 204
    else
      render json: { error: 'Not Found' }.to_json, status: 404
    end
  end

  def show
    if @user
      render json: @user
    else
      render json: { error: 'Not Found' }.to_json, status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def find_user
    @user = User.find_by_id(params[:id])
  end
end
