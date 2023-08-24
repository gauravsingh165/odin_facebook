class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_current_user
   
  
    
    private
  
    def set_current_user
      @current_user = current_user
    end

    

    def create
      super do |user|
        user.profile_photo.attach(params[:user][:profile_photo]) if params[:user][:profile_photo]
      end
    end
    protected
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :phone, :profile_photo])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone, :profile_photo,:work,:education,:intrest,:address])

    end
end
