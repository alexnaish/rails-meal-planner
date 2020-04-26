class SessionsController < ApplicationController
  def new
    @return_path = request.query_parameters['return'];
  end

  def create

    path = params['return_path'].start_with?("/") ? params['return_path'] : root_url

    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to path, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

end
