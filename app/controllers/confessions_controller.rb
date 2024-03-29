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
  end


  def show
    @confession = Confession.find(params[:id])
  end

  def destroy
    Confession.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to confessions_url
  end

  def index
    @confessions = Confession.paginate(:page => params[:page])
  end

  def popular_recently
    @confessions = Confession.popular_recently.paginate(:page => params[:page])
  end

  def popular_today
    @confessions = Confession.popular.paginate(:page => params[:page])
  end

  def popular_this_week
    @confessions = Confession.popular_this_week.paginate(:page => params[:page])
  end

  def popular_all_time
    @confessions = Confession.popular_all_time.paginate(:page => params[:page])
  end

  def vote_up
    begin
      current_user.vote_for(@confession = Confession.find(params[:id]))
      render :nothing => true, :status => 200
    rescue ActiveRecord::RecordInvalid
      render :nothing => true, :status => 404
    end
  end

  def vote_down
    begin
      current_user.vote_against(@confession = Confession.find(params[:id]))
      redirect_to :back
    rescue ActiveRecord::RecordInvalid
      redirect_to :back
    end
  end
end

