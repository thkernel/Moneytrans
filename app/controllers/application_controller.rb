class ApplicationController < ActionController::Base

	before_action :store_user_location!, if: :storable_location?

  private
  

 
  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:account, request.fullpath)
  end

   
    
end
