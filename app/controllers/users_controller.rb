class UsersController < ApplicationController
  def new
  end

  def create
    User.create!(user_params)
    redirect_to action: "show"
  end

  def show
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
