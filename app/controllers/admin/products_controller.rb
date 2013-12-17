class Admin::ProductsController < ApplicationController
	before_filter :authenticate_admin
	layout 'admin'
	def index
		@products = Product.all
	end
	def new
		@categories = Category.all
		@product = Product.new
	end
	def show
		@product = Product.find(params[:id])
	end
	def edit
		@product = Product.find(params[:id])
	end
	def create
    @categories = Category.where(parent_id: nil)
    @product =  Product.new params[:product]
    if @product.save
		  redirect_to admin_product_path(@product)
		else
		  render :new
		end 
	end

	def destroy
		@product = Product.find(params[:id])
		if @product.delete
			redirect_to :action => "index"
		else
			render 'index'
		end
	end
	def update
		@product = Product.find(params[:id])
		@product.update_attributes(params[:product])
		redirect_to admin_product_path(@product)
	end
end
