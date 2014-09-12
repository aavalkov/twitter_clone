class UsersController < ApplicationController
  def index
    @user = User.new
    @tweet = Tweet.new

    if params[:search]
      search = params[:search]
      @results = User.basic_search(search[:query])
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @tweet= Tweet.new
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
