class Sound < ActiveRecord::Base
  attr_accessible :date, :description, :id, :location, :path, :title, :username

def self.uploadfile(upload)
 Rails.logger.error 'in save!!'
 Rails.logger.error upload['mysound']	   
name =  upload['mysound'].original_filename
	
 Rails.logger.error "###############"
    directory = "public/data"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['mysound'].read) }
 
 end
end
