class RTagSound < ActiveRecord::Base
  belongs_to :sound
  belongs_to :tag

  attr_accessible :id, :sound_id, :tag_id, :tag_title

  def set(tag_id, tag_title, sound_id)
    self.tag_id = tag_id
    self.tag_title = tag_title
    self.sound_id = sound_id
  end
end
