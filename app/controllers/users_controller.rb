class UsersController < ApplicationController

  # before_action do
  #   user_id = session[:user_id]
  #   @current_user = User.find_by id: user_id
  #   # if @current_user.nil?
  #   #   redirect_to login_path
  #   # end
  # end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new params.require(:user).permit(:username, :password, :email, :password_confirmation)
    if @user.save
        flash[:success] = "Welcome to this coolio app!"
        redirect_to @user
      else
        render :new
      end
  end
  #
  # def follow
  #   user = User.find params[:id]
  #   @current_user.follow (user)
  #   redirect_to root_path, notice: "You just followed" "#{user.username}"
  # end
  #
  #




end
