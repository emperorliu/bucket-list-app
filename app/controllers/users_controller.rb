class UsersController < ApplicationController
  before_action :require_user, only: [:show]

  def welcome
  end

  def new
    @user = User.new
  end

  def index
    @users = User.all.sort_by { |user| user.username }
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Your user was created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by slug: params[:id]
  end

  def user_params
    params.require(:user).permit!
  end

end