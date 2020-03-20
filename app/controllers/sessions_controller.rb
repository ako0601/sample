class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.where(email: params[:email]).first
    if @user && @user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = @user.auth_token
      else
        cookies[:auth_token] = @user.auth_token
      end
      login(@user)
      redirect_url = session[:protected_page] ? session[:protected_page] : root_path
      session[:protected_page] = nil
      redirect_to redirect_url, notice: "Logged In"
    else
      redirect_to login_path, alert: "Invalid email/password"
    end
    rescue BCrypt::Errors::InvalidHash
      redirect_to login_path, alert: "Invalid Password. Did you sign up with Github?"
  end 
  
  def destroy
    logout
    cookies.delete(:auth_token)
    redirect_to login_path, notice: "Logged Out."
  end
end
