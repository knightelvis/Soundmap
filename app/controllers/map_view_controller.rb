class MapViewController < ApplicationController

  before_filter :authenticate_user!, except: [:hometest]

  def index

    @current_page = 'home'
    @sounds = Sound.where("user_id = ?", current_user.id).order("updated_at DESC")
    @feed_items = current_user.feed.paginate(:page => params[:page], :per_page => 10)

  end

  def hometest

    @current_page = 'home'
    @user_id = rand(1..1000)
    @user = User.find(@user_id)
    @sounds = @user.sounds
    @feed_items = @user.feed.paginate(:page => params[:page], :per_page => 20)

  end

end
