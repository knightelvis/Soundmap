class UsersController < ApplicationController

  before_filter :authenticate_user!

  def index

    @current_page = 'users'
    @users = User.paginate(:page => params[:page], :per_page => 15)

  end

  def show
    @current_page = 'sounds'
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def sounds

    @user = User.find(params[:id])

    respond_to do |format|
      format.json { render json: { :sounds => @user.sounds, :favored_sounds => @user.favored_sounds } }
    end
  end

end
