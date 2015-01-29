class SessionController < ApplicationController
  
   def new
    # loads the login-form from the view sessions/new.html.erb
   end
  
  def create
    
    #user = User.find_by(name: params[:session][:name])
    #if user && user.authenticate(params[:session][:password])
    #  # call helper method log_in (se helpers/seesionhelper)
    #  log_in user
    #end
    flash.now[:danger] = 'Du klickade på knappen'
  end
  

end
