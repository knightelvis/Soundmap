class MapViewController < ApplicationController

  before_filter :authenticate_user!, except: [:hometest]
  caches_page :hometest
  expires_cache :controller => 'map_view_controller', :action => 'hometest'

  def index

    @current_page = 'home'
    @sounds = Sound.where("user_id = ?", current_user.id).order("updated_at DESC")
    @feed_items = current_user.feed.paginate(:page => params[:page], :per_page => 10)

  end

  def hometest

    @current_page = 'home'
    @user_id = rand(1..1000)
    @user = data_cache('user' + @user_id.to_s) { User.find(@user_id) }
    @sounds = data_cache('sound' + @user_id.to_s) { @user.sounds }
    @feed_items = data_cache('feed' + @user_id.to_s) { @user.feed.paginate(:page => params[:page], :per_page => 20) }

  end

end
