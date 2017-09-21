class UsersController < ApplicationController
  access admin: :all
  
  def edit
    set_user
    @roles = ['user', 'editor', 'admin']
  end

  def update
    set_user
    if @user.update(user_params)
      redirect_to pages_admin_dash_url, notice: 'User was succefully updated.'
    else
      render :edit
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