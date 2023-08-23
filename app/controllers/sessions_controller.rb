class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(login: params[:login])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
    else
      redirect_to user_path(@user)
    end
  end

  def destroy
  end
end
