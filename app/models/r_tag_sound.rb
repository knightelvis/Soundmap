class RTagSound < ActiveRecord::Base
  belongs_to :sound
  belongs_to :tag

  attr_accessible :id, :sound_id, :tag_id, :tag_title
end
