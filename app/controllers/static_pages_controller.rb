class StaticPagesController < ApplicationController
  def about
  end

  def welcome
  	if current_user.signed_in?
  		redirect_to home_path
  	end
  end

  def creators
  end

  def work_with_us
  end

  def help
  end
end
