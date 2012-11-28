class MapViewController < ApplicationController

  def index

    if user_signed_in?
      @sounds = Sound.where("user_id = ?", current_user.id).order("updated_at DESC")
      @feed_items = current_user.feed
    end

  end

end
