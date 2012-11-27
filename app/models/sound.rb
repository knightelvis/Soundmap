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

  belongs_to :user

  has_many :likes
  has_many :users, :through => :likes

  validates :user_id, :presence => true
  validates :title, :presence => true
  validates :location, :presence => true, :format => { :with => /[+\-]?\d+(.\d+)?,[+\-]?\d+(.\d+)?/ }

  mount_uploader :path, SoundUploader

  default_scope order: 'sounds.created_at DESC'

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end

end
