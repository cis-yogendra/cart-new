class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!#,:except => [:show, :index]
  before_filter :banned? 

	def after_sign_in_path_for(resource)
	  unless current_user.try(:is_admin?)      
      root_url
  	else
  		admin_root_url
  	end
	end

	def banned?
    if current_user.present? && current_user.banned?
      sign_out current_user
      flash[:notice] = "This account has been blocked."
      root_path
    end
  end

	protected 

	def authenticate_admin
    unless current_user.try(:is_admin?)      
      redirect_to :root_url , :alert => 'Vissible only for admin'
    end
	end  	
end
