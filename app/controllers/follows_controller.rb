class FollowsController < ApplicationController

  def new
    @follow = follow.new
  end

  def create
    Follow.create({user_id: current_user.id, followed_user_id: params[:user_id]})
    follower = User.find(params[:user_id])
    UserMailer.following(current_user, follower).deliver
    redirect_to user_path(follower.id)
  end
end
