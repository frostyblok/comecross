class SessionsController < ApplicationController
  def login; end

  def signup
  end

  def create
    if params[:commit] == 'Login'
      if params[:email] == 'user' && params[:password] == 'password'
        flash[:success] = 'Login successful!'
        redirect_to root_path
      else
        flash[:error] = 'Invalid username or password'
        render :new
      end
    elsif params[:commit] == 'Signup'
      User.create!(user_params)
      flash[:success] = 'Signup successful!'
      redirect_to root_path
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email)
  end
end
