class Admin::DashboardsController < ApplicationController
  before_filter :authenticate_admin
  layout 'admin'

  def index
  	@dashboards = User.all
  end
end
