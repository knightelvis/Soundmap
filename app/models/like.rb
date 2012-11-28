class Like < ActiveRecord::Base
  attr_accessible :favored_sound_id, :user_id

  belongs_to :user
  belongs_to :favored_sound, :class_name => 'Sound'

end
