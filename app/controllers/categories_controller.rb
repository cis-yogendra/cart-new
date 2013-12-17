class CategoriesController < ApplicationController
	def index
		@categories = Category.where(parent_id: nil)
	end
	def show
		@category = Category.find(params[:id])
	end
end
