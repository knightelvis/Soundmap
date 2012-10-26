class Sound < ActiveRecord::Base
  attr_accessible :date, :description, :id, :location, :path, :title, :username

def self.save(upload)
    name =  upload['sound'].original_filename
	Rails.logger.error 'in save!!'
Rails.logger.error name
    directory = "public/data"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['sound'].read) }
  end
end
