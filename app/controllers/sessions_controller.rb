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

end