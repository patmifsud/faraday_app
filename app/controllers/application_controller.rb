class ApplicationController < ActionController::Base
    before_action :fetch_user
  

    






    def url?(string)
        uri = URI.parse(string)
        %w( http https ).include?(uri.scheme)
      rescue URI::BadURIError
        false
      rescue URI::InvalidURIError
        false
    end




    private
    def fetch_user
      @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
      session[:user_id] = nil unless @current_user.present? # Log out non-existent users.
    end
  
    def check_for_login
      redirect_to login_path unless @current_user.present?
    end
  

end
  