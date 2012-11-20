class Tag < ActiveRecord::Base
  has_many :r_tag_sounds, :foreign_key => "tag_id"
  has_many :sounds, :through => :r_tag_sounds

  attr_accessible :id, :title
end
