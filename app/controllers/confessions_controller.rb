class ConfessionsController < ApplicationController

	def new
		@confession = Confession.new
	end

	def create
		@confession = Confession.new(params[:confession])
	    if @confession.save
	      redirect_to home_path
	    else
	      render 'new'
	    end
	    @confession.total_votes = 0
	end


	def show
		@confession = Confession.find(params[:id])
	end

	def index
		# if current_user.signed_in? == false
		# 	redirect_to root_path
		# else
		@confessions = Confession.paginate(:page => params[:page])
		#try checking for user logged in here
		
	end

	def index_by_popular_day
		@confessions = Confession.paginate(:page => params[:page])
	end

	def index_by_popular_week
		@confessions = Confession.paginate(:page => params[:page])
	end

	def index_by_popular_all_time
		@confessions = Confession.paginate(:page => params[:page])
	end

	def vote_up
	    
	      current_user.vote_for(@confession = Confession.find(params[:id]))
	      render :nothing => true, :status => 200
	      # redirect_to :back
		  rescue ActiveRecord::RecordInvalid
		  render :nothing => true, :status => 404
		  # redirect_to :back
		
	end

	def vote_down
	    begin
	      current_user.vote_against(@confession = Confession.find(params[:id]))
	      # render :nothing => true, :status => 200
	      redirect_to :back
		  rescue ActiveRecord::RecordInvalid
		  # render :nothing => true, :status => 404
		  redirect_to :back
		end
	end


	
end


