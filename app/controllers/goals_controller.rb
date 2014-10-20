class GoalsController < ApplicationController
  before_action :require_user, only: [:new, :create, :destroy]

  def index
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.creator = current_user
    if @goal.save
      flash[:notice] = "Your goal was added!"
      redirect_to user_path(@goal.creator)
    else
      render 'new'
    end
  end

  def goal_params
    params.require(:goal).permit!
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    flash[:notice] = "Your goal was deleted."
    redirect_to :back
  end

  def cheer
    @goal = Goal.find(params[:id])
    @cheer = Cheer.create(cheerable: @goal, creator: current_user, cheer: params[:cheer])
    respond_to do |format|
      format.html { redirect_to :back, notice: "Your cheer was counted"}
      format.js
    end
  end
end