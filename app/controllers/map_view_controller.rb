class MapViewController < ApplicationController

  def index

    @current_page = 'home'

    if user_signed_in?
      @sounds = Sound.where("user_id = ?", current_user.id).order("updated_at DESC")
      @feed_items = current_user.feed.paginate(:page => params[:page], :per_page => 10)
    else
      redirect_to '/explore'
    end

  end

end
