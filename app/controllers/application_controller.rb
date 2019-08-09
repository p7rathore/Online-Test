class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	def require_admin
		unless current_user and current_user.admin
			redirect_to current_user
		end
	end
end
