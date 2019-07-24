class ApplicationController < ActionController::Base
  private
      def logged_in_user?
      unless  !session[:user_id].nil?
        flash[:notice]= "Please log in."
        redirect_to new_user_registration_path
      end
    end
end
