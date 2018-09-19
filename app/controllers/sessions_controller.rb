class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
      # Log the user in and redirect to the user's show page.
    else
      flash.now[:danger] = 'Contraseña o usuario invalido' # Not quite right!
      render 'new'
    end
  end

  def destroy
  end
end
