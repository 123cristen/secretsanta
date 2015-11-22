class SessionsController < ApplicationController
  def new
  end

  def create
    group = Group.find_by(name: params[:session][:name].downcase)
    if group && group.authenticate(params[:session][:password])
      log_in group
      redirect_to group
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
