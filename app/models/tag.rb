class Tag < ActiveRecord::Base
  #has_many :r_tag_sounds, :foreign_key => "tag_id"
  #has_many :sounds, :through => :r_tag_sounds

  attr_accessible :id, :title, :count

  has_many :sound_tag_relations, :dependent => :destroy
  has_many :sounds, :through => :sound_tag_relations

  def set(title, count=0)
    self.title = title
    self.count = count
  end

  def increment
    self.count += 1
    self.save
  end

  def decrement
    self.count -= 1
    self.save

    if self.count == 0
      self.destroy
    end
  end
end
