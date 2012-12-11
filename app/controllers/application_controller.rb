class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def data_cache(key)
    unless output = CACHE.get(key)
      output = yield
      CACHE.set(key, output, 1.hour)
    end
    return output
  end

end
