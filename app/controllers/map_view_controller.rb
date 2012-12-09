class MapViewController < ApplicationController

  before_filter :authenticate_user!

  def index

    @current_page = 'home'
    @sounds = Sound.where("user_id = ?", current_user.id).order("updated_at DESC")
    @feed_items = current_user.feed.paginate(:page => params[:page], :per_page => 10)

  end

end
