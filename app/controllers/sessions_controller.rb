# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    admin = Admin.find_by(email: params[:session][:email].downcase)
    admin&.authenticate(params[:session][:password]) ? admin_login_successfully(admin) : wrong_login
  end

  def destroy
    session[:admin_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to root_path
  end

  private

  def admin_login_successfully(admin)
    session[:admin_id] = admin.id # To persist admin session authenticate
    flash[:notice] = 'Welcome to Admin hub 🙋🏽'
    redirect_to stores_path
  end

  def wrong_login
    # Create an error message.
    flash.now[:alert] = 'Invalid email/password combination'
    render 'new'
  end
end
