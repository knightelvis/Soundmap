module SoundsHelper

  def most_recent_sound(user_id)
    User.find(user_id).sound[0]
  end

end
