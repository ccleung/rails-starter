class Api::UsersController < Api::BaseController
  def index
    render json: { index: '' }.to_json
  end

  def create
  end

  def destroy
  end

  def show
    @user = User.find_by_id(params[:id])
    if @user
      render json: @user
    else
      render json: { error: 'Not Found' }.to_json, status: 404
    end
  end
end
