class Sound < ActiveRecord::Base
  attr_accessible :id, :description, :path, :location, :title, :username, :date
end
