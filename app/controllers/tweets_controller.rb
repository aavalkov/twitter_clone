class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:tweet, :user_id)
  end

end
