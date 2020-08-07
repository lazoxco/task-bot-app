class RobotsController < ApplicationController
  before_action :current_robot, only: [:show, :edit, :update, :destroy]

  def index
    @robots = Robot.all
  end

  def show
    # @robot = Robot.find(params[:id])
  end

  def new
    @robot = Robot.new
  end

  def create
    @robot = Robot.create(robot_params)
    if @robot.save
      redirect_to robot_path(@robot)
    else
      render :new
    end
  end

  def edit
    # @robot = Robot.find(params[:id])
  end

  def update
    # @robot = Robot.find(params[:id])
    @robot.update(robot_params)

    redirect_to robot_path(@robot)
  end

  def destroy
    # @robot = Robot.find(params[:id])
    @robot.destroy

    redirect_to robots_path
  end

  private

  def robot_params
    params.require(:robot).permit(:name, :slogan)
  end

  def current_robot
    @robot = Robot.find(params[:id])
  end
end
