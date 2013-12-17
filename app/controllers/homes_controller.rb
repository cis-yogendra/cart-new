class HomesController < ApplicationController
	def index
		@homes = User.all
	end
end
