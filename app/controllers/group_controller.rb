class GroupController < ApplicationController
  def show
  	@group = Group.find(params[:id])
  end

  def new
  	@group = Group.new
  end

  def create
  	@group = Group.new(group_params)
    if @group.save
      log_in @group
      flash[:success] = "Welcome to Secret Santa!"
      redirect_to @group
    else
      message = pluralize(@group.errors.count, "error")
      flash.now[:danger] = "This form contains #{message}"
      render 'new'
    end
  end

  def destroy
  end

  private

    def group_params
      params.require(:group).permit(:name, :password,
                                   :password_confirmation)
    end
end
