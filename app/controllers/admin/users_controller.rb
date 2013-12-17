class Admin::UsersController < ApplicationController
  before_filter :authenticate_admin
  layout 'admin'
  def index
    @users = User.users
  end
end
