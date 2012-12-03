class SoundTagRelation < ActiveRecord::Base
  attr_accessible :sound_id, :tag_id

  belongs_to :sound
  belongs_to :tag
end
