class ApplicationController < ActionController::API
	include Response

	before_action :authenticate_user!, except: %i[index show]

end
