class ApplicationController < ActionController::Base
  include Pundit

  helper_method :current_user

  # after_action :verify_authorized, except: :index

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
    return unless session[:user_id]

    @user = User.find(session[:user_id])
  end

  private

  def user_not_authorized
    redirect_to root_path
  end
end
