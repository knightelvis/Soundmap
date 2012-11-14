class ExploreController < ApplicationController


  def index

    if user_signed_in?
      @sounds = Sound.where("user_id = ?", current_user.id).order("updated_at DESC")
    end

  end


end
