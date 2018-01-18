class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  
  end

  def new
  end

  def index
  	@users = User.paginate(page: params[:page])
  end

  def destroy
  	User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
end