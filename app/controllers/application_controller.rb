class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionHelper

  # def showing_followers
  #   @user = User.find(params[:id])
  #   @tweets = @user.tweets
  #   followers_id = @current_user.following_users.pluck(:id)
  #   id_of_tweets = followers_id << @current_user.id
  #   @tweets = Tweet.where(user_id: id_of_tweets).order("created_at desc")
  #   @users = User.all
  #               .reject{|user| @current_user.following? user}
  #               .reject{|user| @current_user == user}
  # end



end
