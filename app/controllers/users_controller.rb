class UsersController < ApplicationController

# before_action
#   :showing_followers



  before_action do

    @user_id = session[:user_id]
    @current_user = User.find_by id: @user_id
    #  if @current_user.nil?
    #     redirect_to login_path
    #  end
     #
    #  @tweets = Tweet.all
    #                 .order("created_at desc")
    #                 .page(params[:page])

  end

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    followers_id = @current_user.following_users.pluck(:id)
    id_of_tweets = followers_id << @current_user.id
    @tweets = Tweet.where(user_id: id_of_tweets).order("created_at desc").page(params[:page])
    @users = User.all
                .reject{|user| @current_user.following? user}
                .reject{|user| @current_user == user}

end
# def show
#   :showing_followers
# end


  def create
    @user = User.new params.require(:user).permit(:username, :password, :email, :password_confirmation, :id)
    if @user.save
        flash[:success] = "Welcome to this coolio app!"
        redirect_to @user
      else
        render :new
      end
  end

  def follow
    user = User.find(params[:id])
    @current_user.follow(user)
    redirect_to user_path
  end

  def unfollow
      user = User.find(params[:id])
      @current_user.stop_following(user)
      redirect_to user_path,  notice: "You just unfollowed " "#{user.username}"
  end

  def destroy
    @current_user = User.find(params[:id])
    @current_user.destroy
    redirect_to login_path
  end


end
