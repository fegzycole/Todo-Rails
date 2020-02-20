class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @user = User.get_user_data(params[:id])

    respond_to do |format|
      format.json { render json: @user, status: :ok }
    end
  end

  def update
    
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
