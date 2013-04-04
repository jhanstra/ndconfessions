class UsersController < ApplicationController
	before_filter :signed_in_user, only: [:home]
  def new
  	@user = User.new
  end

  def show
  	@user = User.find( params[:id] )
  end

  def create
  	@user = User.new( params[:user] )
    if @user.save
      sign_in @user
      redirect_to home_path
    else
      render 'new'
    end
  end

  private
  	def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end


end
