class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :logged_in
  add_flash_types :success, :info, :error, :warning
  rescue_from ActiveRecord::RecordNotFound, with: :return_to_index

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def logged_in
    if !current_user
      redirect_to login_url(return: request.path)
    end
  end

  private

    def return_to_index
      session[:user_id] = nil
      redirect_to root_url
    end

end
