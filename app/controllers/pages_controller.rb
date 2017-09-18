class PagesController < ApplicationController
  def admin_dash
    if logged_in?(:admin)
      @user = User.all.order("roles DESC")
    else
      redirect_to root_path, notice: "You are not authorized to view this page..."
    end
  end
end
