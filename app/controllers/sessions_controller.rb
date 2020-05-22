class SessionsController < ApplicationController
  def new; end

  # TODO: NoMethodError: undefined method `authenticate' for nil:NilClass
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user.authenticate(params[:session][:password])
      # TODO: NoMethodError: undefined method `log_in' for #<SessionsController:0x00007fb0e7c9c760>
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end

