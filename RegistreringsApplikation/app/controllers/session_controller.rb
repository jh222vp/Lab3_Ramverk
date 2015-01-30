class SessionController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to @user
      # Log the user in and redirect to the user's show page.
    else
      # Create an error message.
      @user = User.new if @user.nil?
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
      end
   end
end