class ApplicationController < ActionController::Base
 
	before_action :store_user_location!, if: :storable_location?

  def current_ability
    # instead of Ability.new(current_user)
    @current_ability ||= Ability.new(current_account)
  end


  #rescue_from CanCan::AccessDenied do |exception|  
  #  flash[:alert] = "Access denied!"  
  #  redirect_to dashboard_path
  #end




  private
  

 
  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:account, request.fullpath)
  end

   
    
end
