class FollowsController < ApplicationController

  def new
    @follow = follow.new
  end

  def create
    Follow.create({user_id: current_user.id, followed_user_id: params[:user_id]})
    redirect_to root_path
  end
end
