class Like < ActiveRecord::Base
  attr_accessible :sound_id, :user_id

  belongs_to :user
  belongs_to :sound

end
