# == Schema Information
#
# Table name: sounds
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  location    :string(255)
#  path        :string(255)
#  username    :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sound < ActiveRecord::Base
  attr_accessible :id, :description, :path, :location, :latitude, :longitude, :title, :user_id

  # user ownership of sounds
  belongs_to :user

  # user-sounds like
  has_many :likes
  has_many :users, :through => :likes

  # sound has tag
  has_many :sound_tag_relations, :dependent => :destroy
  has_many :tags, :through => :sound_tag_relations, :dependent => :destroy

  validates :user_id, :presence => true
  validates :title, :presence => true
  validates :location, :presence => true, :format => { :with => /[+\-]?\d+(.\d+)?,[+\-]?\d+(.\d+)?/ }

  mount_uploader :path, SoundUploader

  default_scope order: 'sounds.created_at DESC'

  def add_tag!(tag)
    sound_tag_relations.create(tag_id: tag.id)
  end

  def remove_tag!(tag)
    sound_tag_relations.find_by_tag_id(tag.id).destroy
  end

  def has_tag?(tag)
    sound_tag_relations.find_by_tag_id(tag.id)
  end

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end

end
