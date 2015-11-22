class GroupsController < ApplicationController
  before_action :logged_in_group, only: [:edit, :update, :destroy]
  before_action :correct_group,   only: [:edit, :update]

  def show
  	@group = Group.find(params[:id])
  end

  def new
  	@group = Group.new
  end

  def create
  	@group = Group.new(group_params)
    if @group.save
      #log_in @group
      flash[:success] = "Welcome to Secret Santa!"
      redirect_to @group
    else
      #message = "#{@group.errors.count} errors"
      #flash.now[:danger] = "This form contains #{message}"
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      flash[:success] = "Group updated"
      redirect_to @group
    else
      render 'edit'
    end
  end

  def destroy
    Group.find(params[:id]).destroy
    flash[:success] = "Group deleted"
    redirect_to root_url
  end

  private

    def group_params
      params.require(:group).permit(:name, :password,
                                   :password_confirmation)
    end

        # Confirms a logged-in group.
    def logged_in_group
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

        # Confirms the correct group.
    def correct_user
      @group = Group.find(params[:id])
      redirect_to(root_url) unless @group == current_group
    end
end
