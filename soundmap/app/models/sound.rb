class Sound < ActiveRecord::Base
  attr_accessible :id, :description, :path, :location, :title, :username
  attr_accessible :upload_file


  def upload_file=(upload)
    name =  upload.original_filename

    # create the file path
    self.path = "sounds/" + name
    # write the file
    File.open("public/" + self.path, "wb") { |f| f.write(upload.read) }
  end
end
