class SessionsController < ApplicationController

  def create
    # binding.pry
    officer = Officer.find_by_email(params[:session][:email])

      if officer && officer.authenticate(params[:session][:password])
        session[:officer_id] = officer.id
        redirect_to "/cities/#{officer.city_id}/officers"
      else 
        flash[:notice] = "Your email and/or password are incorrect. Please try again"
      end
  end

  def current_officer
    @current_officer ||= Officer.find_by(id: session[:officer_id])
  end

  def logged_in?
    !current_officer.nil?
  end

  def logout
    session.delete(:officer_id)
    @current_officer = nil
  end

end