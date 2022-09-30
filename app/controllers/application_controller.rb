# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_admin, :logged_in?

  def current_admin
    # memoization : in order to not repeat the same query to the database.
    # if @current_admin is nil, then we will execute the query to the database.
    # if @current_admin is not nil, then we will return the value of @current_admin.
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def logged_in?
    !!current_admin
  end

  # helpers methods for views
  def require_admin
    unless logged_in?
      flash[:alert] = 'You must be logged in as Admin to perform that action'
      redirect_to login_path
    end
  end

  def require_logout
    if logged_in?
      flash[:alert] = 'You must log out first'
      redirect_to stores_path
    end
  end
end
