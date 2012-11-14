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

  validates :user_id, :presence => true
  validates :title, :presence => true
  validates :location, :presence => true, :format => { :with => /[+\-]?\d+(.\d+)?,[+\-]?\d+(.\d+)?/ }

  mount_uploader :path, SoundUploader

  #attr_accessible :upload_file
  #
  #
  #def upload_file=(upload)
  #  name =  upload.original_filename
  #
  #  # create the file path
  #  self.path = "sounds/" + name
  #  # write the file
  #  File.open("public/" + self.path, "wb") { |f| f.write(upload.read) }
  #end
end
