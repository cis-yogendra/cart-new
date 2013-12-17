class Admin::CategoriesController < ApplicationController
	before_filter :authenticate_admin
	layout 'admin'
	def index
		@categories = Category.where(parent_id: nil)
	end
	def new
		@category = Category.new
		@categories = Category.where(parent_id: nil)
	end
	def show
		@category = Category.find(params[:id])
	end
	def edit
		@category = Category.find(params[:id])
		@categories = Category.where(parent_id: nil)
	end
	def create
		@category = Category.new(params[:category])
		@categories = Category.where(parent_id: nil)
		if @category.save
		  redirect_to admin_category_path(@category)
		else
		  render :new
		end 
	end
	def update
		@category = Category.find(params[:id])
		@article.update_attributes(params[:category])
		redirect_to admin_category_path(@category)
	end
	def destroy
		@category = Category.find(params[:id])
		if @category.delete
			redirect_to :action => 'index'
		else
			render 'index'
		end
	end
end
