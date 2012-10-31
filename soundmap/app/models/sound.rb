class Sound < ActiveRecord::Base
  attr_accessible :id, :description, :path, :location, :title, :username, :date
  attr_accessible :upload_file


  def upload_file=(upload)
    Rails.logger.error 'in save!!'
    Rails.logger.error upload
    name =  upload.original_filename

    Rails.logger.error "###############"
    directory = "public/sounds"
    # create the file path
    #path = File.join(directory, name)
    self.path = "sounds/" + name
    # write the file
    File.open("public/" + self.path, "wb") { |f| f.write(upload.read) }

  end
end
