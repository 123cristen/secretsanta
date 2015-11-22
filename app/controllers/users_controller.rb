class UsersController < ApplicationController
  before_action :logged_in_group

	def create
		@user= current_group.users.build(user_params)
    if @user.save
      flash[:success] = "Group member added!"
      redirect_to group_url(@user.group_id)
    else
      render 'new'
    end
	end

	def update
	end

	def destroy
    #@user.destroy
    flash[:success] = "Member deleted"
    redirect_to request.referrer
	end

  def new
  	@user= User.new
  end

  def edit
  end

  private

      def user_params
      params.require(:user).permit(:name, :email)
    end
end
