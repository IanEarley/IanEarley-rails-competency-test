class UsersController < ApplicationController
  def edit
    set_user
    @roles = ['user', 'editor', 'admin']
  end

  def update
    set_user
    if logged_in?(:admin)
      if @user.update(user_params)
        redirect_to pages_admin_dash_url, notice: 'User was succefully updated.'
      else
        render :edit
      end
    else
      redirect_to root_path, notice: "You are not authorized to perform this action..."
    end
  end

  private
    
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:roles)
    end
end