class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def data_cache(key)
    unless output = Rails.cache.read(key)
      output = yield
      Rails.cache.write(key, output, :expires_in => 60)
    end
    return output
  end

end
